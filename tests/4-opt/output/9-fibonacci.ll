; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/9-fibonacci.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @fibonacci(i32 %arg0) {
label_entry:
  %op1 = icmp eq i32 %arg0, 0
  br i1 %op1, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  ret i32 0
label_2:                                                ; preds = %label_entry
  %op2 = icmp eq i32 %arg0, 1
  br i1 %op2, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  ret i32 1
label_5:                                                ; preds = %label_2
  %op3 = sub i32 %arg0, 1
  %op4 = call i32 @fibonacci(i32 %op3)
  %op5 = sub i32 %arg0, 2
  %op6 = call i32 @fibonacci(i32 %op5)
  %op7 = add i32 %op4, %op6
  ret i32 %op7
}
define i32 @main() {
label_entry:
  br label %label_8
label_7:                                                ; preds = %label_8
  %op0 = call i32 @fibonacci(i32 %op2)
  call void @output(i32 %op0)
  %op1 = add i32 %op2, 1
  br label %label_8
label_8:                                                ; preds = %label_entry, %label_7
  %op2 = phi i32 [ 0, %label_entry ], [ %op1, %label_7 ]
  %op3 = icmp slt i32 %op2, 10
  br i1 %op3, label %label_7, label %label_9
label_9:                                                ; preds = %label_8
  ret i32 0
}
