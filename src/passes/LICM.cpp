#include "LICM.hpp"
#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "FuncInfo.hpp"
#include "Function.hpp"
#include "GlobalVariable.hpp"
#include "Instruction.hpp"
#include "PassManager.hpp"
#include "Value.hpp"
#include <cstddef>
#include <iostream>
#include <map>
#include <memory>
#include <ostream>
#include <set>
#include <stdexcept>
#include <vector>

/**
 * @brief 循环不变式外提Pass的主入口函数
 *
 */
void LoopInvariantCodeMotion::run() {

    loop_detection_ = std::make_unique<LoopDetection>(m_);
    loop_detection_->run();
    func_info_ = std::make_unique<FuncInfo>(m_);
    func_info_->run();
    for (auto &loop : loop_detection_->get_loops()) {
        is_loop_done_[loop] = false;
    }

    for (auto &loop : loop_detection_->get_loops()) {
        traverse_loop(loop);
    }
}

/**
 * @brief 遍历循环及其子循环
 * @param loop 当前要处理的循环
 *
 */
void LoopInvariantCodeMotion::traverse_loop(std::shared_ptr<Loop> loop) {
    if (is_loop_done_[loop]) {
        return;
    }
    is_loop_done_[loop] = true;
    for (auto &sub_loop : loop->get_sub_loops()) {
        traverse_loop(sub_loop);
    }
    run_on_loop(loop);
}

// TODO: 实现collect_loop_info函数
// 1. 遍历当前循环及其子循环的所有指令
// 2. 收集所有指令到loop_instructions中
// 3. 检查store指令是否修改了全局变量，如果是则添加到updated_global中
// 4. 检查是否包含非纯函数调用，如果有则设置contains_impure_call为true
void LoopInvariantCodeMotion::collect_loop_info(
    std::shared_ptr<Loop> loop, std::set<Value *> &loop_instructions,
    std::set<Value *> &updated_global, bool &contains_impure_call) {

    for (auto bb : loop->get_blocks()) {
        for (auto &ins : bb->get_instructions()) {
            loop_instructions.emplace(&ins);
        }
    }
    for (auto ins : loop_instructions) {
        auto inst = dynamic_cast<Instruction *>(ins);
        if (inst->is_store()) {
            auto op = inst->get_operand(1);
            if (dynamic_cast<GlobalVariable *>(op) != nullptr)
                updated_global.insert(op);
            continue;
        }
        if (!contains_impure_call && inst->is_call()) {
            auto func = dynamic_cast<CallInst *>(inst)->get_function();

            if (func_info_->is_pure_function(func) == false)
                contains_impure_call = true;
        }
    }
    // throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
}

class InstVec : public std::vector<Instruction *> {
  public:
    bool contain(Value *v) {
        for (auto &i : *this) {
            if (i == v)
                return true;
        }
        return false;
    }
    void insert(Value *v) { push_back(dynamic_cast<Instruction *>(v)); }
};

/**
 * @brief 对单个循环执行不变式外提优化
 * @param loop 要优化的循环
 *
 */
void LoopInvariantCodeMotion::run_on_loop(std::shared_ptr<Loop> loop) {
    std::set<Value *> loop_instructions;
    std::set<Value *> updated_global;
    std::set<BasicBlock *> blocks;
    for (auto b : loop->get_blocks())
        blocks.insert(b);
    bool contains_impure_call = false;
    collect_loop_info(loop, loop_instructions, updated_global,
                      contains_impure_call);

    InstVec loop_invariant;

    // TODO: 识别循环不变式指令
    //
    // - 如果指令已被标记为不变式则跳过
    // - 跳过 store、ret、br、phi 等指令与非纯函数调用
    // - 特殊处理全局变量的 load 指令
    // - 检查指令的所有操作数是否都是循环不变的
    // - 如果有新的不变式被添加则注意更新 changed 标志，继续迭代
    std::set<Function *> func_set;
    std::set<Function *> impure_set;
    bool changed;
    do {
        changed = false;
        for (auto &v : loop_instructions) {
            if (loop_invariant.contain(v))
                continue;
            auto inst = dynamic_cast<Instruction *>(v);
            int idx = 0;
            if (inst->is_store() || inst->is_ret() || inst->is_br() ||
                inst->is_phi())
                continue;
            if (inst->is_call() && contains_impure_call) {
                auto call = dynamic_cast<CallInst *>(inst);
                auto func = call->get_function();
                if (func_set.count(func) == 0) {
                    func_set.insert(func);
                    if (!func_info_->is_pure_function(func)) {
                        impure_set.insert(func);
                        continue;
                    }
                } else if (impure_set.count(func))
                    continue;
                idx = 1;
            }
            if (inst->is_load()) {
                auto op = inst->get_operand(0);
                if (!updated_global.count(op))
                    continue;
                loop_invariant.insert(inst);
                changed = true;
                continue;
            }
            auto &ops = inst->get_operands();
            int size = ops.size();
            bool c = true;
            for (int i = idx; i < size; i++) {
                auto &op = ops[i];
                if (dynamic_cast<Constant *>(op) == nullptr &&
                    loop_instructions.count(op) != 0 &&
                    !loop_invariant.contain(op)) {
                    c = false;
                    break;
                }
            }
            if (c) {
                loop_invariant.insert(inst);
                changed = true;
                continue;
            }
        }
        std::cout << "\033[34mBegin Replace:\033[0m" << std::endl;
        for (auto &v : loop_instructions) {
            if (loop_invariant.contain(v))
                std::cout << "\033[31m" << v->print() << "\033[0m" << std::endl;
            else
                std::cout << v->print() << std::endl;
        }
        // throw std::runtime_error("Lab4: 你有一个TODO需要完成！");

    } while (changed);

    if (loop_invariant.empty())
        return;

    if (loop->get_preheader() == nullptr) {
        loop->set_preheader(
            BasicBlock::create(m_, "", loop->get_header()->get_parent()));
    }

    // insert preheader
    auto preheader = loop->get_preheader();

    // TODO: 更新 phi 指令
    for (auto &phi_inst_ : loop->get_header()->get_instructions()) {
        if (phi_inst_.get_instr_type() != Instruction::phi)
            break;
        auto phi = dynamic_cast<PhiInst *>(&phi_inst_);
        if (loop->get_header()->get_name() == "label_2")
            std::cout << phi->print() << std::endl;
        std::map<BasicBlock *, Value *> phiMap;
        Value *v = nullptr;
        int preCount = 0;
        for (auto [i, j] : phi->get_phi_pairs()) {
            phiMap[j] = i;
            v = i;
            if (!blocks.count(j))
                preCount++;
        }
        phi->remove_all_operands();
        if (preCount > 1) {
            auto phi2 = PhiInst::create_phi(v->get_type(), preheader);
            preheader->add_instr_begin(phi2);
            for (auto [bb, value] : phiMap) {
                if (blocks.count(bb)) {
                    phi->add_phi_pair_operand(value, bb);
                } else {
                    phi2->add_phi_pair_operand(value, bb);
                }
                phi->add_phi_pair_operand(phi2, preheader);
            }
        } else {
            for (auto [bb, value] : phiMap) {
                if (blocks.count(bb)) {
                    phi->add_phi_pair_operand(value, bb);
                } else {
                    phi->add_phi_pair_operand(value, preheader);
                }
            }
        }

        std::cout << "count" << phi->get_num_operand() << std::endl;
        // throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
    }

    // TODO: 用跳转指令重构控制流图
    // 将所有非 latch 的 header 前驱块的跳转指向 preheader
    // 并将 preheader 的跳转指向 header
    // 注意这里需要更新前驱块的后继和后继的前驱

    std::vector<BasicBlock *> pred_to_remove;
    for (auto &pred : loop->get_header()->get_pre_basic_blocks()) {
        if (blocks.count(pred) == 0)
            pred_to_remove.emplace_back(pred);
        // throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
    }
    for (auto &pred : pred_to_remove) {
        loop->get_header()->remove_pre_basic_block(pred);
        pred->remove_succ_basic_block(loop->get_header());
        pred->add_succ_basic_block(preheader);
        preheader->add_pre_basic_block(pred);
        auto &ins = pred->get_instructions().back();
        int size = ins.get_operands().size();
        for (int i = 0; i < size; i++) {
            if (ins.get_operand(i) == loop->get_header()) {
                ins.set_operand(i, preheader);
            }
        }
    }

    // TODO: 外提循环不变指令
    for (auto ins : loop_invariant) {
        ins->get_parent()->remove_instr(ins);
        preheader->add_instruction(ins);
    }

    // throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
    // insert preheader br to header

    BranchInst::create_br(loop->get_header(), preheader);

    // insert preheader to parent loop
    if (loop->get_parent() != nullptr) {
        loop->get_parent()->add_block(preheader);
    }
}
