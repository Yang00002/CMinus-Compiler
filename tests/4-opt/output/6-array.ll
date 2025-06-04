; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/6-array.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  store i32 11, i32* %op1
  %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  store i32 22, i32* %op2
  %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  store i32 33, i32* %op3
  %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op5 = load i32, i32* %op4
  call void @output(i32 %op5)
  %op6 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  %op7 = load i32, i32* %op6
  call void @output(i32 %op7)
  %op8 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  %op9 = load i32, i32* %op8
  call void @output(i32 %op9)
  ret i32 0
}
