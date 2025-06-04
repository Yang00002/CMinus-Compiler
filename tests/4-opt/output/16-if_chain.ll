; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/16-if_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = icmp ne i32 1, 0
  br i1 %op0, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  %op1 = icmp ne i32 0, 0
  br i1 %op1, label %label_3, label %label_4
label_2:                                                ; preds = %label_entry, %label_5
  %op2 = phi i32 [ 2, %label_entry ], [ %op3, %label_5 ]
  ret i32 %op2
label_3:                                                ; preds = %label_1
  br label %label_5
label_4:                                                ; preds = %label_1
  br label %label_5
label_5:                                                ; preds = %label_3, %label_4
  %op3 = phi i32 [ 4, %label_3 ], [ 3, %label_4 ]
  br label %label_2
}
