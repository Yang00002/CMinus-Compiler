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

int main() {
	auto module = new Module();
    auto builder = new IRBuilder(nullptr, module);
	auto Int32Type = module->get_int32_type();
	auto calleeFunc = Function::create(FunctionType::get(Int32Type, {Int32Type}),"callee", module);
	auto bb = BasicBlock::create(module, "calleeEntry", calleeFunc);
    builder->set_insert_point(bb);
	auto vcallee0 = &*calleeFunc->get_args().begin();
	auto vcallee2 = builder->create_imul(vcallee0,CONST_INT(2));
	builder->create_ret(vcallee2);
	auto mainFunc = Function::create(FunctionType::get(Int32Type, {}),"main", module);
	bb = BasicBlock::create(module,"Entry", mainFunc);
	builder->set_insert_point(bb);
	auto v1 = builder->create_call(calleeFunc,{CONST_INT(110)});
	builder->create_ret(v1);
	std::cout << module->print();
    delete module;
    return 0;
}