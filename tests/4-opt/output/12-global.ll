; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/12-global.cminus"

@seed = global i32 0
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @randomLCG() {
label_entry:
  %op0 = load i32, i32* @seed
  %op1 = mul i32 %op0, 1103515245
  %op2 = add i32 %op1, 12345
  store i32 %op2, i32* @seed
  %op3 = load i32, i32* @seed
  ret i32 %op3
}
define i32 @randBin() {
label_entry:
  %op0 = call i32 @randomLCG()
  %op1 = icmp sgt i32 %op0, 0
  br i1 %op1, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  ret i32 1
label_2:                                                ; preds = %label_entry
  ret i32 0
}
define i32 @returnToZeroSteps() {
label_entry:
  br label %label_5
label_4:                                                ; preds = %label_5
  %op0 = call i32 @randBin()
  %op1 = icmp ne i32 %op0, 0
  br i1 %op1, label %label_7, label %label_8
label_5:                                                ; preds = %label_entry, %label_11
  %op2 = phi i32 [ 0, %label_entry ], [ %op8, %label_11 ]
  %op3 = phi i32 [ 0, %label_entry ], [ %op7, %label_11 ]
  %op4 = icmp slt i32 %op2, 20
  br i1 %op4, label %label_4, label %label_6
label_6:                                                ; preds = %label_5
  ret i32 20
label_7:                                                ; preds = %label_4
  %op5 = add i32 %op3, 1
  br label %label_9
label_8:                                                ; preds = %label_4
  %op6 = sub i32 %op3, 1
  br label %label_9
label_9:                                                ; preds = %label_7, %label_8
  %op7 = phi i32 [ %op5, %label_7 ], [ %op6, %label_8 ]
  %op8 = add i32 %op2, 1
  %op9 = icmp eq i32 %op7, 0
  br i1 %op9, label %label_10, label %label_11
label_10:                                                ; preds = %label_9
  ret i32 %op8
label_11:                                                ; preds = %label_9
  br label %label_5
}
define i32 @main() {
label_entry:
  store i32 3407, i32* @seed
  br label %label_13
label_12:                                                ; preds = %label_13
  %op0 = call i32 @returnToZeroSteps()
  call void @output(i32 %op0)
  %op1 = add i32 %op2, 1
  br label %label_13
label_13:                                                ; preds = %label_entry, %label_12
  %op2 = phi i32 [ 0, %label_entry ], [ %op1, %label_12 ]
  %op3 = icmp slt i32 %op2, 20
  br i1 %op3, label %label_12, label %label_14
label_14:                                                ; preds = %label_13
  ret i32 0
}
