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
#define ARRAY_INDEX(idx) _a_r_r_a_y_I_n_d_e_x_(idx,module)
#define POINTER_INDEX(idx) _p_o_i_n_t_e_r_I_n_d_e_x_(idx,module)
std::vector<Value*> _a_r_r_a_y_I_n_d_e_x_(int i, Module*& module)
{
	return {ConstantInt::get(0,module),ConstantInt::get(i,module)};
}
std::vector<Value*> _a_r_r_a_y_I_n_d_e_x_(Value* v, Module*& module)
{
	return {ConstantInt::get(0,module),v};
}
std::vector<Value*> _p_o_i_n_t_e_r_I_n_d_e_x_(int i, Module*& module)
{
	return {ConstantInt::get(i,module)};
}
std::vector<Value*> _p_o_i_n_t_e_r_I_n_d_e_x_(Value* v, Module*& module)
{
	return {v};
}
int main()
{
	auto module = new Module();
    auto builder = new IRBuilder(nullptr, module);
	auto Int32Type = module->get_int32_type();
	auto FloatType = module->get_float_type();
	auto mainFunc = Function::create(FunctionType::get(Int32Type,{}), "main",module);
	auto bb = BasicBlock::create(module, "Entry", mainFunc);
	builder->set_insert_point(bb);
	auto v1 = builder->create_alloca(FloatType);
	builder->create_store(CONST_FP(5.555), v1);
	auto v2 = builder->create_load(v1);
	auto v3 = builder->create_fcmp_gt(v2, CONST_FP(1));
	auto v4 = BasicBlock::create(module, "LABEL-V4", mainFunc);
	auto v5 = BasicBlock::create(module, "LABEL-V5", mainFunc);
	builder->create_cond_br(v3, v4, v5);
	builder->set_insert_point(v4);
	builder->create_ret(CONST_INT(233));
	builder->set_insert_point(v5);
	builder->create_ret(CONST_INT(0));
	std::cout << module->print();
    delete module;
    return 0;
}