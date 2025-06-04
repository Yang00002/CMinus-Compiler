; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/8-store.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @store(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op3 = icmp sge i32 %arg1, 0
  br i1 %op3, label %label_1, label %label_exit
label_exit:                                                ; preds = %label_entry
  call void @neg_idx_except()
  ret i32 0
label_1:                                                ; preds = %label_entry
  %op4 = getelementptr i32, i32* %arg0, i32 %arg1
  store i32 %arg2, i32* %op4
  ret i32 %arg2
}
define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  br label %label15
label_2:                                                ; preds = %label_3
  %op2 = mul i32 %op5, 2
  %op3 = call i32 @store(i32* %op1, i32 %op5, i32 %op2)
  %op4 = add i32 %op5, 1
  br label %label_3
label_3:                                                ; preds = %label_2, %label15
  %op5 = phi i32 [ 0, %label15 ], [ %op4, %label_2 ]
  %op6 = icmp slt i32 %op5, 10
  br i1 %op6, label %label_2, label %label_4
label_4:                                                ; preds = %label_3
  br label %label_6
label_5:                                                ; preds = %label_6
  %op7 = icmp sge i32 %op9, 0
  br i1 %op7, label %label_8, label %label_exit
label_6:                                                ; preds = %label_4, %label_8
  %op8 = phi i32 [ 0, %label_4 ], [ %op13, %label_8 ]
  %op9 = phi i32 [ 0, %label_4 ], [ %op14, %label_8 ]
  %op10 = icmp slt i32 %op9, 10
  br i1 %op10, label %label_5, label %label_7
label_7:                                                ; preds = %label_6
  call void @output(i32 %op8)
  ret i32 0
label_exit:                                                ; preds = %label_5
  call void @neg_idx_except()
  ret i32 0
label_8:                                                ; preds = %label_5
  %op11 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op9
  %op12 = load i32, i32* %op11
  %op13 = add i32 %op8, %op12
  %op14 = add i32 %op9, 1
  br label %label_6
label15:                                                ; preds = %label_entry
  %op1 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  br label %label_3
}
