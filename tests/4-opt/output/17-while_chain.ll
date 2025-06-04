; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/17-while_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label_2
label_1:                                                ; preds = %label_2
  %op0 = sub i32 %op2, 1
  br label %label_5
label_2:                                                ; preds = %label_entry, %label_6
  %op1 = phi i32 [ %op6, %label_6 ], [ undef, %label_entry ]
  %op2 = phi i32 [ 10, %label_entry ], [ %op0, %label_6 ]
  %op3 = icmp ne i32 %op2, 0
  br i1 %op3, label %label_1, label %label_3
label_3:                                                ; preds = %label_2
  %op4 = add i32 %op2, %op1
  ret i32 %op4
label_4:                                                ; preds = %label_5
  %op5 = sub i32 %op6, 1
  br label %label_5
label_5:                                                ; preds = %label_1, %label_4
  %op6 = phi i32 [ %op0, %label_1 ], [ %op5, %label_4 ]
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label_4, label %label_6
label_6:                                                ; preds = %label_5
  br label %label_2
}
