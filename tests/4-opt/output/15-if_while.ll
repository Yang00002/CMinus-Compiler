; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/15-if_while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label_2
label_1:                                                ; preds = %label_2
  %op0 = sub i32 %op3, 1
  %op1 = icmp slt i32 %op0, 5
  br i1 %op1, label %label_4, label %label_5
label_2:                                                ; preds = %label_entry, %label_6
  %op2 = phi i32 [ 0, %label_entry ], [ %op9, %label_6 ]
  %op3 = phi i32 [ 10, %label_entry ], [ %op0, %label_6 ]
  %op4 = phi i32 [ 0, %label_entry ], [ %op10, %label_6 ]
  %op5 = icmp ne i32 %op3, 0
  br i1 %op5, label %label_1, label %label_3
label_3:                                                ; preds = %label_2
  %op6 = add i32 %op2, %op4
  ret i32 %op6
label_4:                                                ; preds = %label_1
  %op7 = add i32 %op2, %op0
  br label %label_6
label_5:                                                ; preds = %label_1
  %op8 = add i32 %op4, %op0
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5
  %op9 = phi i32 [ %op7, %label_4 ], [ %op2, %label_5 ]
  %op10 = phi i32 [ %op4, %label_4 ], [ %op8, %label_5 ]
  br label %label_2
}
