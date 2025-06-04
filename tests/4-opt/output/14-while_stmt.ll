; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/14-while_stmt.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  br label %label_2
label_1:                                                ; preds = %label_2
  %op0 = sub i32 %op1, 1
  br label %label_2
label_2:                                                ; preds = %label_entry, %label_1
  %op1 = phi i32 [ 10, %label_entry ], [ %op0, %label_1 ]
  %op2 = icmp ne i32 %op1, 0
  br i1 %op2, label %label_1, label %label_3
label_3:                                                ; preds = %label_2
  ret void
}
