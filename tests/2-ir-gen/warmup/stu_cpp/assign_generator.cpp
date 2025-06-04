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
	auto mainFun =
        Function::create(FunctionType::get(Int32Type, {}), "main", module);
    auto bb = BasicBlock::create(module, "entry", mainFun);
    builder->set_insert_point(bb);
	auto arrayTypeInt4 = ArrayType::get(Int32Type, 4);
	auto v1 = builder->create_alloca(arrayTypeInt4);
	auto v2 = builder->create_gep(v1, ARRAY_INDEX(0));
    builder->create_store(CONST_INT(10), v2);
	auto v3 = builder->create_gep(v1, ARRAY_INDEX(1));
    auto v4 = builder->create_load(v2);
	auto v5 = builder->create_imul(v4,CONST_INT(2));
	builder->create_store(v5, v3);
	auto v6 = builder->create_load(v3);
	builder->create_ret(v6);
	std::cout << module->print();
    delete module;
    return 0;
}