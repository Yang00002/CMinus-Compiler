; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/mem2reg/mem2reg-2.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label_2
label_1:                                                ; preds = %label_2
  %op0 = add i32 %op1, 1
  br label %label_2
label_2:                                                ; preds = %label_entry, %label_1
  %op1 = phi i32 [ 1, %label_entry ], [ %op0, %label_1 ]
  %op2 = icmp slt i32 %op1, 999999999
  br i1 %op2, label %label_1, label %label_3
label_3:                                                ; preds = %label_2
  ret i32 %op1
}
