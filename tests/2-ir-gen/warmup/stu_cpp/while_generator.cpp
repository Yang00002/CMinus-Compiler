#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Instruction.hpp"
#include "Module.hpp"
#include "Type.hpp"
#include "Value.hpp"

#include <initializer_list>
#include <iostream>
#include <memory>
#include <vector>

#define CONST_INT(num) ConstantInt::get(num, module)
#define CONST_FP(num) ConstantFP::get(num, module)
#define ARRAY_INDEX(idx) _a_r_r_a_y_I_n_d_e_x_(idx, module)
#define POINTER_INDEX(idx) _p_o_i_n_t_e_r_I_n_d_e_x_(idx, module)
std::vector<Value *> _a_r_r_a_y_I_n_d_e_x_(int i, Module *&module) {
    return {ConstantInt::get(0, module), ConstantInt::get(i, module)};
}
std::vector<Value *> _a_r_r_a_y_I_n_d_e_x_(Value *v, Module *&module) {
    return {ConstantInt::get(0, module), v};
}
std::vector<Value *> _p_o_i_n_t_e_r_I_n_d_e_x_(int i, Module *&module) {
    return {ConstantInt::get(i, module)};
}
std::vector<Value *> _p_o_i_n_t_e_r_I_n_d_e_x_(Value *v, Module *&module) {
    return {v};
}

int main() {
    auto module = new Module();
    auto builder = new IRBuilder(nullptr, module);
    auto Int32Type = module->get_int32_type();
    auto mainFunc =
        Function::create(FunctionType::get(Int32Type, {}), "main", module);
    auto bb = BasicBlock::create(module, "Entry", mainFunc);
    auto v3 = BasicBlock::create(module, "LABEL_V3", mainFunc);
    auto v9 = BasicBlock::create(module, "LABEL_V9", mainFunc);
    auto v12 = BasicBlock::create(module, "LABEL_V12", mainFunc);
    builder->set_insert_point(bb);
	auto v1 = builder->create_alloca(Int32Type);
    auto v2 = builder->create_alloca(Int32Type);
	builder->create_store(CONST_INT(10), v1);
    builder->create_store(CONST_INT(0), v2);
	builder->create_br(v9);
	builder->set_insert_point(v3);
	auto v4 = builder->create_load(v2);
	auto v5 = builder->create_iadd(v4, CONST_INT(1));
	builder->create_store(v5, v2);
	auto v6 = builder->create_load(v2);
	auto v7 = builder->create_load(v1);
	auto v8 = builder->create_iadd(v6, v7);
	builder->create_store(v8, v1);
	builder->create_br(v9);
	builder->set_insert_point(v9);
	auto v10 =builder->create_load(v2);
	auto v11 = builder->create_icmp_lt(v10, CONST_INT(10));
	builder->create_cond_br(v11, v3, v12);
	builder->set_insert_point(v12);
	auto v13 = builder->create_load(v1);
	builder->create_ret(v13);
    std::cout << module->print();
    delete module;
    return 0;
}
