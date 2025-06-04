; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/4-if.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = icmp sgt i32 11, 22
  br i1 %op0, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  %op1 = icmp sgt i32 11, 33
  br i1 %op1, label %label_4, label %label_5
label_2:                                                ; preds = %label_entry
  %op2 = icmp slt i32 33, 22
  br i1 %op2, label %label_7, label %label_8
label_3:                                                ; preds = %label_6, %label_9
  ret i32 0
label_4:                                                ; preds = %label_1
  call void @output(i32 11)
  br label %label_6
label_5:                                                ; preds = %label_1
  call void @output(i32 33)
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5
  br label %label_3
label_7:                                                ; preds = %label_2
  call void @output(i32 22)
  br label %label_9
label_8:                                                ; preds = %label_2
  call void @output(i32 33)
  br label %label_9
label_9:                                                ; preds = %label_7, %label_8
  br label %label_3
}
