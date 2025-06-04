; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/12-funcall_recursion.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @factorial(i32 %arg0) {
label_entry:
  %op1 = icmp eq i32 %arg0, 0
  br i1 %op1, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  ret i32 1
label_2:                                                ; preds = %label_entry
  %op2 = sub i32 %arg0, 1
  %op3 = call i32 @factorial(i32 %op2)
  %op4 = mul i32 %arg0, %op3
  ret i32 %op4
}
define i32 @main() {
label_entry:
  %op0 = call i32 @factorial(i32 10)
  ret i32 %op0
}
