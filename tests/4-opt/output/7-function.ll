; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/7-function.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @min(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp sle i32 %arg0, %arg1
  br i1 %op2, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  ret i32 %arg0
label_2:                                                ; preds = %label_entry
  ret i32 %arg1
}
define i32 @main() {
label_entry:
  %op0 = call i32 @min(i32 11, i32 22)
  call void @output(i32 %op0)
  %op1 = call i32 @min(i32 22, i32 33)
  call void @output(i32 %op1)
  %op2 = call i32 @min(i32 33, i32 11)
  call void @output(i32 %op2)
  ret i32 0
}
