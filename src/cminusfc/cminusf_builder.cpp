#include "cminusf_builder.hpp"
#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "GlobalVariable.hpp"
#include "Instruction.hpp"
#include "Type.hpp"
#include "User.hpp"
#include "Value.hpp"
#include "ast.hpp"
#include "logging.hpp"
#include <cstddef>
#include <iostream>
#include <iterator>
#include <memory>
#include <ostream>
#include <string>
#include <tuple>
#include <unistd.h>
#include <utility>
#include <vector>

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())

// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;

#define USE_LOG
#ifdef USE_LOG
#define debug(a) LOG(DEBUG) << a;
#define info(a) LOG(INFO) << std::string("\033[1;10;34;49m") + a + "\033[0m";
#define warning(a)                                                             \
    LOG(WARNING) << std::string("\033[1;10;33;49m") + a + "\033[0m";
#define error(a) LOG(ERROR) << std::string("\033[1;10;31;49m") + a + "\033[0m";
#else
#define debug(a) std::cout << a << std::endl;
#define info(a) std::cout << std::string("\033[1;10;34;49m") + a + "\033[0m\n";
#define warning(a)                                                             \
    std::cout << std::string("\033[1;10;33;49m") + a + "\033[0m\n";
#define error(a) std::cout << std::string("\033[1;10;31;49m") + a + "\033[0m\n";
#endif

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

bool isVar(std::shared_ptr<ASTFactor> &factor) {
    if (std::dynamic_pointer_cast<ASTVar>(factor)) {
        debug("Factor is var");
        return true;
    } else {
        debug("Factor not var");
        return false;
    }
}

Value *CminusfBuilder::visit(ASTProgram &node) {
    VOID_T = module->get_void_type();
    INT1_T = module->get_int1_type();
    INT32_T = module->get_int32_type();
    INT32PTR_T = module->get_int32_ptr_type();
    FLOAT_T = module->get_float_type();
    FLOATPTR_T = module->get_float_ptr_type();

    Value *ret_val = nullptr;
    for (auto &decl : node.declarations) {
        ret_val = decl->accept(*this);
    }
    return ret_val;
}

Value *CminusfBuilder::visit(ASTNum &node) {
    if (node.type == TYPE_INT) {
        return CONST_INT(node.i_val);
    } else {
        return CONST_FP(node.f_val);
    }
    // TODO: This function is empty now.
    // Add some code here.
}

Value *CminusfBuilder::visit(ASTVarDeclaration &node) {
    debug("Begin Declare var " + node.id);
    if (scope.in_global()) {
        if (node.num == nullptr) {
            if (node.type == TYPE_INT) {
                info("declare global var name " + node.id + " type int32");
                scope.push(node.id, GlobalVariable::create(
                                        node.id, module.get(), INT32_T, false,
                                        CONST_INT(0)));
                debug("End Declare var " + node.id);
                return nullptr;
            }
            info("declare global var name " + node.id + " type float");
            scope.push(node.id,
                       GlobalVariable::create(node.id, module.get(), FLOAT_T,
                                              false, CONST_FP(0.0)));
            debug("End Declare var " + node.id);
            return nullptr;
        }
        if (node.type == TYPE_INT) {
            ArrayType *art;
            art = ArrayType::get(INT32_T, node.num->i_val);
            info("declare global int array var " + node.id + " type " +
                 art->print());
            scope.push(node.id, GlobalVariable::create(
                                    node.id, module.get(), art, false,
                                    ConstantZero::get(art, module.get())));
            debug("End Declare var " + node.id);
            return nullptr;
        }
        ArrayType *art;
        art = ArrayType::get(FLOAT_T, node.num->i_val);
        info("declare global float array var " + node.id + " type " +
             art->print());
        scope.push(node.id, GlobalVariable::create(
                                node.id, module.get(), art, false,
                                ConstantZero::get(art, module.get())));
        debug("End Declare var " + node.id);
        return nullptr;
    }
    Type *type;
    if (node.num == nullptr) {
        if (node.type == TYPE_INT)
            type = INT32_T;
        else
            type = FLOAT_T;
    } else {
        if (node.type == TYPE_INT)
            type = ArrayType::get(INT32_T, node.num->i_val);
        else
            type = ArrayType::get(FLOAT_T, node.num->i_val);
    }
    info("declare var " + node.id + " type " + type->print());
    scope.push(node.id,
               AllocaInst::create_alloca(type, builder->get_insert_block()));
    // TODO: This function is empty now.
    // Add some code here.
    debug("End Declare var " + node.id);
    return nullptr;
}

Value *CminusfBuilder::visit(ASTFunDeclaration &node) {
    debug("begin declare Function " + node.id);
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;

    for (auto &param : node.params) {
        // TODO: Please accomplish param_types.
        if (param->isarray) {
            if (param->type == TYPE_INT) {
                param_types.push_back(INT32PTR_T);
            } else {
                param_types.push_back(FLOATPTR_T);
            }
        } else {
            if (param->type == TYPE_INT) {
                param_types.push_back(INT32_T);
            } else {
                param_types.push_back(FLOAT_T);
            }
        }
    }

    fun_type = FunctionType::get(ret_type, param_types);
    auto func = Function::create(fun_type, node.id, module.get());
    info(func->print());
    scope.push(node.id, func);
    context.func = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args()) {
        args.push_back(&arg);
    }
    for (unsigned int i = 0; i < node.params.size(); ++i) {
        auto v = node.params[i]->accept(*this);
        if (v == nullptr) {
            scope.push(node.params[i]->id, args[i]);
        } else {
            scope.push(node.params[i]->id, v);
            builder->create_store(args[i], v);
        }
        // TODO: You need to deal with params and store them in the scope.
    }
    debug("Function " + node.id + " parameters published");
    node.compound_stmt->accept(*this);
    if (not builder->get_insert_block()->is_terminated()) {
        if (context.func->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (context.func->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
    debug("end declare Function " + node.id);
    return nullptr;
}

Value *CminusfBuilder::visit(ASTParam &node) {
    if (node.isarray) {
        info("declare para array " + node.id);
        return nullptr;
    } else {
        if (node.type == TYPE_INT) {
            {
                info("declare para " + node.id + ", create var int32");
                return builder->create_alloca(INT32_T);
            }
        } else {
            {
                info("declare para " + node.id + ", create var float");
                return builder->create_alloca(FLOAT_T);
            }
        }
    }
}

Value *CminusfBuilder::visit(ASTCompoundStmt &node) {
    // TODO: This function is not complete.
    // You may need to add some code here
    // to deal with complex statements.

    for (auto &decl : node.local_declarations) {
        decl->accept(*this);
    }

    for (auto &stmt : node.statement_list) {
        if (std::dynamic_pointer_cast<ASTCompoundStmt>(stmt)) {
            scope.enter();
            stmt->accept(*this);
            scope.exit();
        } else
            stmt->accept(*this);
        if (builder->get_insert_block()->is_terminated())
            break;
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTExpressionStmt &node) {
    if (node.expression != nullptr)
        node.expression->accept(*this);
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value *CminusfBuilder::visit(ASTSelectionStmt &node) {
    if (node.else_statement == nullptr) {
        auto cond = node.expression->accept(*this);
        auto blockIf = createBasicBlock();
        BasicBlock *blockAnd = createBasicBlock();
        builder->create_cond_br(setValueType(cond, INT1_T), blockIf, blockAnd);
        builder->set_insert_point(blockIf);
        node.if_statement->accept(*this);
        if (builder->get_insert_block()->is_terminated() == false)
            builder->create_br(blockAnd);
        builder->set_insert_point(blockAnd);
    } else {
        /*
        auto cond = node.expression->accept(*this);
auto blockIf = createBasicBlock();
auto blockElse = createBasicBlock();
BasicBlock *blockAnd = nullptr;
builder->create_cond_br(setValueType(cond, INT1_T), blockIf, blockElse);
builder->set_insert_point(blockIf);
node.if_statement->accept(*this);
if (builder->get_insert_block()->is_terminated() == false) {
    if (blockAnd == nullptr)
        blockAnd = createBasicBlock();
    builder->create_br(blockAnd);
}
builder->set_insert_point(blockElse);
node.else_statement->accept(*this);
if (builder->get_insert_block()->is_terminated() == false) {
    if (blockAnd == nullptr)
        blockAnd = createBasicBlock();
    builder->create_br(blockAnd);
}
if (blockAnd != nullptr)
    builder->set_insert_point(blockAnd);
        */
        auto cond = node.expression->accept(*this);
        auto blockIf = createBasicBlock();
        auto blockElse = createBasicBlock();
        BasicBlock *blockAnd = createBasicBlock();
        builder->create_cond_br(setValueType(cond, INT1_T), blockIf, blockElse);
        builder->set_insert_point(blockIf);
        node.if_statement->accept(*this);
        if (builder->get_insert_block()->is_terminated() == false) {
            builder->create_br(blockAnd);
        }
        builder->set_insert_point(blockElse);
        node.else_statement->accept(*this);
        if (builder->get_insert_block()->is_terminated() == false) {
            builder->create_br(blockAnd);
        }
        builder->set_insert_point(blockAnd);
    }
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value *CminusfBuilder::visit(ASTIterationStmt &node) {
    auto content = createBasicBlock();
    auto cond = createBasicBlock();
    auto next = createBasicBlock();
    builder->create_br(cond);
    builder->set_insert_point(cond);
    auto c = node.expression->accept(*this);
    builder->create_cond_br(setValueType(c, INT1_T), content, next);
    builder->set_insert_point(content);
    node.statement->accept(*this);
    if (builder->get_insert_block()->is_terminated() == false)
        builder->create_br(cond);
    builder->set_insert_point(next);
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value *CminusfBuilder::visit(ASTReturnStmt &node) {
    debug("Begin Generate ReturnStatement for " + context.func->get_name());
    if (node.expression == nullptr) {
        builder->create_void_ret();
        info("function " + context.func->get_name() +
             " return void, expected " +
             context.func->get_return_type()->print());
        return nullptr;
    } else {
        info("function " + context.func->get_name() + " return " +
             context.func->get_return_type()->print());
        builder->create_ret(setValueType(node.expression->accept(*this),
                                         context.func->get_return_type()));
        // TODO: The given code is incomplete.
        // You need to solve other return cases (e.g. return an integer).
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTVar &node) {
    debug("Begin load var " + node.id);
    Value *basic = scope.find(node.id);
    debug("Var " + node.id + " type " + basic->get_type()->print());
    Value *index;
    if (node.expression == nullptr) {
        index = CONST_INT(0);
    } else {
        index = setValueType(node.expression->accept(*this), INT32_T);
        ConstantInt *constIndex = dynamic_cast<ConstantInt *>(index);
        if (constIndex != nullptr) {
            if (constIndex->get_value() < 0) {
                error("Const index " + std::to_string(constIndex->get_value()) +
                      " minus to 0");
                exit(-1);
            }
        } else {
            auto greaterThan0 = builder->create_icmp_ge(index, CONST_INT(0));
            auto exitBlock = createExceptionBlock();
            auto nextBlock = createBasicBlock();
            builder->create_cond_br(greaterThan0, nextBlock, exitBlock);
            builder->set_insert_point(nextBlock);
        }
    }
    bool isPara = false;
    for (auto &i : context.func->get_args()) {
        if (&i == basic) {
            isPara = true;
            break;
        }
    }
    if (isPara && node.expression) {
        auto ret = builder->create_gep(basic, {index});
        info("End load array var " + node.id + " as Parameter, return type " +
             ret->get_type()->print());

        return ret;
    } else if (basic->get_type()->get_pointer_element_type()->is_array_type()) {
        auto ret = builder->create_gep(basic, {CONST_INT(0), index});
        info("End load array var " + node.id + ", return type " +
             ret->get_type()->print());
        return ret;
    } else {
        info("End load var " + node.id + ", return type " +
             basic->get_type()->print());
        return basic;
    }
}

Value *CminusfBuilder::visit(ASTAssignExpression &node) {
    info("Assign var " + node.var->id);
    auto exp = node.expression->accept(*this);
    auto var = node.var->accept(*this);
    builder->create_store(
        setValueType(exp, var->get_type()->get_pointer_element_type()), var);
    return exp;
    // TODO: This function is empty now.
    // Add some code here.
}

Value *CminusfBuilder::visit(ASTSimpleExpression &node) {
    if (node.additive_expression_r == nullptr) {
        return node.additive_expression_l->accept(*this);
    } else {

        Value *l = node.additive_expression_l->accept(*this);
        Value *r = node.additive_expression_r->accept(*this);
        auto [l1, r1, fl] = upgradeValues(l, r);
        Value *ret;
        if (fl) {
            switch (node.op) {
            case OP_LE: // <=
                ret = builder->create_fcmp_le(l1, r1);
                break;
            case OP_LT: // <
                ret = builder->create_fcmp_lt(l1, r1);
                break;
            case OP_GT: // >
                ret = builder->create_fcmp_gt(l1, r1);
                break;
            case OP_GE: // >=
                ret = builder->create_fcmp_ge(l1, r1);
                break;
            case OP_EQ: // ==
                ret = builder->create_fcmp_eq(l1, r1);
                break;
            case OP_NEQ: // !=
                ret = builder->create_fcmp_ne(l1, r1);
                break;
            }
        } else {
            switch (node.op) {
            case OP_LE: // <=
                ret = builder->create_icmp_le(l1, r1);
                break;
            case OP_LT: // <
                ret = builder->create_icmp_lt(l1, r1);
                break;
            case OP_GT: // >
                ret = builder->create_icmp_gt(l1, r1);
                break;
            case OP_GE: // >=
                ret = builder->create_icmp_ge(l1, r1);
                break;
            case OP_EQ: // ==
                ret = builder->create_icmp_eq(l1, r1);
                break;
            case OP_NEQ: // !=
                ret = builder->create_icmp_ne(l1, r1);
                break;
            }
        }
        return ret;
    }
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value *CminusfBuilder::visit(ASTAdditiveExpression &node) {
    if (node.additive_expression == nullptr) {
        return node.term->accept(*this);
    } else {
        Value *l = node.additive_expression->accept(*this);
        Value *r = node.term->accept(*this);
        auto [lv, rv, fl] = upgradeValues(l, r);
        if (fl) {
            if (node.op == OP_PLUS) {
                return builder->create_fadd(lv, rv);
            } else {
                return builder->create_fsub(lv, rv);
            }
        } else {
            if (node.op == OP_PLUS) {
                return builder->create_iadd(lv, rv);
            } else {
                return builder->create_isub(lv, rv);
            }
        }
    }
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value *CminusfBuilder::visit(ASTTerm &node) {

    debug("Start calculate term");
    static auto needLoad = [](Function *func, Scope &scope,
                              std::shared_ptr<ASTFactor> &factor) -> bool {
        if (isVar(factor) == false)
            return false;
        auto var = std::dynamic_pointer_cast<ASTVar>(factor);
        auto val = scope.find(std::dynamic_pointer_cast<ASTVar>(factor)->id);
        if (var->expression == nullptr) {
            bool isPara = false;
            for (auto &i : func->get_args()) {
                if (&i == val) {
                    isPara = true;
                    break;
                }
            }
            if (isPara ||
                val->get_type()->get_pointer_element_type()->is_array_type()) {
                return false;
            }
            return true;
        }
        return true;
    };
    if (node.term == nullptr) {
        if (needLoad(context.func, scope, node.factor)) {
            debug("Term need to load");
            return builder->create_load(node.factor->accept(*this));
        } else {
            debug("Term not need to load");
            return node.factor->accept(*this);
        }
    } else {
        Value *l = node.term->accept(*this);
        Value *r = node.factor->accept(*this);
        if (isVar(node.factor))
            r = builder->create_load(r);
        auto [lv, rv, fl] = upgradeValues(l, r);
        if (fl) {
            if (node.op == OP_MUL) {
                return builder->create_fmul(lv, rv);
            } else {
                return builder->create_fdiv(lv, rv);
            }
        } else {
            if (node.op == OP_MUL) {
                return builder->create_imul(lv, rv);
            } else {
                return builder->create_isdiv(lv, rv);
            }
        }
    }
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value *CminusfBuilder::visit(ASTCall &node) {
    debug("Begin Call " + node.id);
    Function *f = (Function *)scope.find(node.id);
    std::vector<Value *> v;
    int idx = 0;
    auto args = node.args;
    for (auto &i : f->get_args()) {
        auto value = setValueType(args[idx]->accept(*this), i.get_type());
        if (value->get_type() != i.get_type()) {
            warning("arg " + i.get_name() + " have type " +
                    value->get_type()->print() + " but expected " +
                    i.get_type()->print());
        }
        v.push_back(value);
        idx++;
    }
    info("Call func " + node.id);
    return builder->create_call(f, v);
    // TODO: This function is empty now.
    // Add some code here.
}

std::tuple<Value *, Value *, bool> CminusfBuilder::upgradeValues(Value *l,
                                                                 Value *r) {
    if (l->get_type()->is_int1_type()) {
        LOG(DEBUG) << "l expr upgrade from " + l->get_type()->print() +
                          " to int32";
        l = builder->create_zext(l, INT32_T);
    }
    if (r->get_type()->is_int1_type()) {
        LOG(DEBUG) << "r expr upgrade from " + l->get_type()->print() +
                          " to int32";
        r = builder->create_zext(r, INT32_T);
    }
    int t0 = l->get_type()->is_float_type();
    int t1 = r->get_type()->is_float_type();
    switch ((t0 << 1) + t1) {
    case 0:
        LOG(DEBUG) << "free from upgrade [" + l->get_type()->print() + ", " +
                          r->get_type()->print() + "]";
        return {l, r, false};
    case 1:
        LOG(DEBUG) << "upgrade [" + l->get_type()->print() + "->float, float]";
        return {builder->create_sitofp(l, FLOAT_T), r, true};
    case 2:
        LOG(DEBUG) << "upgrade [" + l->get_type()->print() + ", " +
                          r->get_type()->print() + "->float]";
        return {l, builder->create_sitofp(r, FLOAT_T), true};
    case 3:
        LOG(DEBUG) << "free from upgrade [" + l->get_type()->print() + ", " +
                          r->get_type()->print() + "]";
        return {l, r, true};
    default:
        return {nullptr, nullptr, false};
    }
}

BasicBlock *CminusfBuilder::createBasicBlock() {
    static int uuid = 0;
    uuid++;
    return BasicBlock::create(builder->get_module(), std::to_string(uuid),
                              context.func);
}

BasicBlock *CminusfBuilder::createExceptionBlock() {
    for (auto &i : context.func->get_basic_blocks()) {
        if (i.get_name() == "label_exit") {
            return &i;
        }
    }
    auto ret = BasicBlock::create(builder->get_module(), "exit", context.func);
    BasicBlock *pre = builder->get_insert_block();
    builder->set_insert_point(ret);
    builder->create_call(scope.find("neg_idx_except"), {});
    auto paratype = context.func->get_return_type();
    if (paratype == VOID_T) {
        builder->create_void_ret();
    } else if (paratype == INT32_T) {
        builder->create_ret(CONST_INT(0));
    } else {
        builder->create_ret(CONST_FP(0.0));
    }
    builder->set_insert_point(pre);
    return ret;
}

Value *CminusfBuilder::setValueType(Value *v, Type *t) {
    auto &type = *v->get_type();
    if (t->is_int1_type()) {
        if (type.is_int32_type()) {
            debug("type translate from int32 to int1");
            return builder->create_icmp_ne(v, CONST_INT(0));
        } else if (type.is_float_type()) {
            debug("type translate from float to int1");
            return builder->create_fcmp_ne(v, CONST_FP(0.0));
        } else {
            debug("won't translate " + type.print() + " to int1");
            return v;
        }
    } else if (t->is_int32_type()) {
        if (type.is_int1_type()) {
            debug("type translate from int1 to int32");
            return builder->create_zext(v, INT32_T);
        } else if (type.is_float_type()) {
            debug("type translate from float to int32");
            return builder->create_fptosi(v, INT32_T);
        } else {
            debug("won't translate " + type.print() + " to int32");
            return v;
        }
    } else if (t->is_float_type()) {
        if (type.is_int1_type()) {
            debug("type translate from int1 to float");
            return builder->create_sitofp(builder->create_zext(v, INT32_T),
                                          FLOAT_T);
        } else if (type.is_int32_type()) {
            debug("type translate from int32 to float");
            return builder->create_sitofp(v, FLOAT_T);
        } else {
            debug("won't translate " + type.print() + " to float");
            return v;
        }
    }
    debug("won't translate " + type.print() + " to " + t->print());
    return v;
}
