#include "ASMInstruction.hpp"
#include "CodeGen.hpp"
#include "Instruction.hpp"
#include "Module.hpp"

#include <iostream>
#include <memory>
#include <string>
#include <unordered_map>

void translate_main(CodeGen *codegen); // 将 main 函数翻译为汇编代码

int main() {
    auto *module = new Module();
    auto *codegen = new CodeGen(module);

    // 告诉汇编器将汇编放到代码段
    codegen->append_inst(".text", ASMInstruction::Atrribute);

    translate_main(codegen);

    std::cout << codegen->print();
    delete codegen;
    delete module;
    return 0;
}

using namespace std;
class CodeGenHelper {
  public:
    class RegisterIdentifier {
        int id;

      public:
        RegisterIdentifier(int i) { id = i; }
        string print() { return "$t" + to_string(id); }
        int value() { return id; }

        operator string() { return print(); }
    };

  private:
    class RegisterAllocater {
        bool registers[9] = {false, false, false, false, false,
                             false, false, false, false};

      public:
        RegisterIdentifier allocate() {
            for (int i = 0; i < 9; i++) {
                if (registers[i] == false) {
                    registers[i] = true;
                    return RegisterIdentifier(i);
                }
            }
            exit(-1);
        }
        void free(RegisterIdentifier i) { registers[i.value()] = false; }
    } registerAllocator;
    CodeGen *codegen;
    int stackAllocBegin = 0;
    int stackSize = 0;
    unordered_map<int, int> scopes;
    int id = 0;
    int createIdentifier() { return id++; }
    string IntToOffset(int i) { return "-" + to_string(i); }
    string FuncName;
    int lid = 0;

  public:
    string createLabel() { return FuncName + "_" + to_string(lid++); }
    CodeGenHelper(CodeGen *codegen) { this->codegen = codegen; }
    void initFunction(std::string funcName, int IntCount = 0,
                      int FloatCount = 0) { // 分配注解和标签
        codegen->append_inst(".globl " + funcName, ASMInstruction::Atrribute);
        codegen->append_inst(".type " + funcName + ", @function",
                             ASMInstruction::Atrribute);
        codegen->append_inst(funcName, ASMInstruction::Label);
        codegen->append_inst("st.d", {"$ra", "$sp", "-8"});
        codegen->append_inst("st.d", {"$fp", "$sp", "-16"});
        codegen->append_inst("addi.d", {"$fp", "$sp", "0"});
        stackSize = 16 + IntCount * 8 + FloatCount * 32;
        codegen->append_inst("addi.d $sp, $sp, " + IntToOffset(stackSize));
        stackAllocBegin = 16;
        FuncName = funcName;
        codegen->append_inst("." + FuncName + "_label_entry",
                             ASMInstruction::Label);
    }
    int allocaIntArray(int elementCount) {
        int ret = createIdentifier();
        scopes[ret] = stackAllocBegin;
        stackAllocBegin += elementCount * 8;
        return ret;
    }
    RegisterIdentifier getElementOfIntArray(int identifier, int offset) {
        RegisterIdentifier reg = registerAllocator.allocate();
        codegen->append_inst(
            "addi.d",
            {reg.print(), "$fp", IntToOffset(scopes[identifier] + offset * 8)});
        return reg;
    }
    void storeInt(RegisterIdentifier target, int value) { // 未处理大整数
        RegisterIdentifier tmp = registerAllocator.allocate();
        codegen->append_inst("addi.w",
                             {tmp.print(), "$zero", to_string(value)});
        codegen->append_inst("st.w", {tmp.print(), target.print(), "0"});
        registerAllocator.free(tmp);
    }
    void storeInt(RegisterIdentifier target, RegisterIdentifier value) {
        codegen->append_inst("st.w", {value.print(), target.print(), "0"});
    }
    RegisterIdentifier loadInt(RegisterIdentifier target) { // 未处理大整数
        RegisterIdentifier reg = registerAllocator.allocate();
        codegen->append_inst("ld.w", {reg.print(), target.print(), "0"});
        return reg;
    }
    RegisterIdentifier multiply(RegisterIdentifier reg1,
                                int value) { // 未处理大整数
        // mul.w $rd, $rj, $rk
        RegisterIdentifier buf = registerAllocator.allocate();
        codegen->append_inst("addi.w",
                             {buf.print(), "$zero", to_string(value)});
        codegen->append_inst("mul.w", {buf.print(), buf.print(), reg1.print()});
        return buf;
    }
    void ret(int value) { // 未处理大整数
        codegen->append_inst("addi.w", {"$a0", "$zero", to_string(value)});
        codegen->append_inst("b " + FuncName + "_exit");
    }
    void ret(RegisterIdentifier value) {
        codegen->append_inst("add.w", {"$a0", "$zero", value.print()});
        codegen->append_inst("b " + FuncName + "_exit");
    }
    void endFunction() {
        codegen->append_inst(FuncName + "_exit", ASMInstruction::Label);
        codegen->append_inst("addi.d $sp, $sp, " + to_string(stackSize));
        codegen->append_inst("ld.d $ra, $sp, -8");
        codegen->append_inst("ld.d $fp, $sp, -16");
        codegen->append_inst("jr $ra");
        stackAllocBegin = 0;
        stackSize = 0;
        scopes.clear();
        id = 0;
        for (int i = 0; i < 9; i++)
            registerAllocator.free(i);
    }
    void freeRegister(RegisterIdentifier id) { registerAllocator.free(id); }
    RegisterIdentifier IntGreaterThan(int a, int b) {
        RegisterIdentifier ra = registerAllocator.allocate();
        codegen->append_inst("addi.w", {ra, "$zero", to_string(b)});
        codegen->append_inst("slti", {ra, ra, to_string(a)});
        return ra;
    }
    RegisterIdentifier IntNot(RegisterIdentifier a, int b) {
        RegisterIdentifier ret = registerAllocator.allocate();
        RegisterIdentifier buf = registerAllocator.allocate();
        codegen->append_inst("addi.w", {ret, "$zero", "0"});
        codegen->append_inst("addi.w", {buf, "$zero", to_string(b)});
        string label = createLabel();
        codegen->append_inst("beq", {a, buf, label});
        codegen->append_inst("addi.w", {ret, "$zero", to_string(1)});
        codegen->append_inst(label, ASMInstruction::Label);
        registerAllocator.free(buf);
        return ret;
    }
    void br(RegisterIdentifier a, string labeltrue, string labelfalse) {
        codegen->append_inst("beq", {a, "$zero", labelfalse});
        codegen->append_inst("b", {labeltrue});
    }
    void insertLabel(string label) {
        codegen->append_inst(label, ASMInstruction::Label);
    }
};

// TODO: 按照提示补全
void translate_main(CodeGen *codegen) {
    CodeGenHelper helper(codegen);
    helper.initFunction("main");
    auto op0 = helper.IntGreaterThan(5, 1);
    auto op2 = helper.IntNot(op0, 0);
    helper.freeRegister(op0);
    string label3 = helper.createLabel();
    string label4 = helper.createLabel();
    helper.br(op2, label3, label4);
    helper.insertLabel(label3);
    helper.ret(233);
    helper.insertLabel(label4);
    helper.ret(0);
    helper.endFunction();
}
