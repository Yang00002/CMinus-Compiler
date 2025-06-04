; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/13-complex.cminus"

@n = global i32 0
@m = global i32 0
@w = global [5 x i32] zeroinitializer
@v = global [5 x i32] zeroinitializer
@dp = global [66 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @max(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp sgt i32 %arg0, %arg1
  br i1 %op2, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  ret i32 %arg0
label_2:                                                ; preds = %label_entry
  ret i32 %arg1
}
define i32 @knapsack(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp sle i32 %arg1, 0
  br i1 %op2, label %label_4, label %label_5
label_4:                                                ; preds = %label_entry
  ret i32 0
label_5:                                                ; preds = %label_entry
  %op3 = icmp eq i32 %arg0, 0
  br i1 %op3, label %label_6, label %label_7
label_6:                                                ; preds = %label_5
  ret i32 0
label_7:                                                ; preds = %label_5
  %op4 = mul i32 %arg0, 11
  %op5 = add i32 %op4, %arg1
  %op6 = icmp sge i32 %op5, 0
  br i1 %op6, label %label_8, label %label_exit
label_exit:                                                ; preds = %label_7, %label_9, %label_10, %label_14, %label_16, %label_15
  call void @neg_idx_except()
  ret i32 0
label_8:                                                ; preds = %label_7
  %op7 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op5
  %op8 = load i32, i32* %op7
  %op9 = icmp sge i32 %op8, 0
  br i1 %op9, label %label_9, label %label_10
label_9:                                                ; preds = %label_8
  %op10 = mul i32 %arg0, 11
  %op11 = add i32 %op10, %arg1
  %op12 = icmp sge i32 %op11, 0
  br i1 %op12, label %label_11, label %label_exit
label_10:                                                ; preds = %label_8
  %op13 = sub i32 %arg0, 1
  %op14 = icmp sge i32 %op13, 0
  br i1 %op14, label %label_12, label %label_exit
label_11:                                                ; preds = %label_9
  %op15 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op11
  %op16 = load i32, i32* %op15
  ret i32 %op16
label_12:                                                ; preds = %label_10
  %op17 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op13
  %op18 = load i32, i32* %op17
  %op19 = icmp slt i32 %arg1, %op18
  br i1 %op19, label %label_13, label %label_14
label_13:                                                ; preds = %label_12
  %op20 = sub i32 %arg0, 1
  %op21 = call i32 @knapsack(i32 %op20, i32 %arg1)
  br label %label_15
label_14:                                                ; preds = %label_12
  %op22 = sub i32 %arg0, 1
  %op23 = call i32 @knapsack(i32 %op22, i32 %arg1)
  %op24 = sub i32 %arg0, 1
  %op25 = sub i32 %arg0, 1
  %op26 = icmp sge i32 %op25, 0
  br i1 %op26, label %label_16, label %label_exit
label_15:                                                ; preds = %label_13, %label_17
  %op27 = phi i32 [ %op21, %label_13 ], [ %op40, %label_17 ]
  %op28 = mul i32 %arg0, 11
  %op29 = add i32 %op28, %arg1
  %op30 = icmp sge i32 %op29, 0
  br i1 %op30, label %label_18, label %label_exit
label_16:                                                ; preds = %label_14
  %op31 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op25
  %op32 = load i32, i32* %op31
  %op33 = sub i32 %arg1, %op32
  %op34 = call i32 @knapsack(i32 %op24, i32 %op33)
  %op35 = sub i32 %arg0, 1
  %op36 = icmp sge i32 %op35, 0
  br i1 %op36, label %label_17, label %label_exit
label_17:                                                ; preds = %label_16
  %op37 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op35
  %op38 = load i32, i32* %op37
  %op39 = add i32 %op34, %op38
  %op40 = call i32 @max(i32 %op23, i32 %op39)
  br label %label_15
label_18:                                                ; preds = %label_15
  %op41 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op29
  store i32 %op27, i32* %op41
  ret i32 %op27
}
define i32 @main() {
label_entry:
  store i32 5, i32* @n
  store i32 10, i32* @m
  %op0 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
  store i32 2, i32* %op0
  %op1 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
  store i32 2, i32* %op1
  %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
  store i32 6, i32* %op2
  %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
  store i32 5, i32* %op3
  %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
  store i32 4, i32* %op4
  %op5 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
  store i32 6, i32* %op5
  %op6 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
  store i32 3, i32* %op6
  %op7 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
  store i32 5, i32* %op7
  %op8 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
  store i32 4, i32* %op8
  %op9 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
  store i32 6, i32* %op9
  br label %label19
label_19:                                                ; preds = %label_20
  %op11 = icmp sge i32 %op12, 0
  br i1 %op11, label %label_22, label %label_exit
label_20:                                                ; preds = %label_22, %label19
  %op12 = phi i32 [ 0, %label19 ], [ %op18, %label_22 ]
  %op13 = icmp slt i32 %op12, 66
  br i1 %op13, label %label_19, label %label_21
label_21:                                                ; preds = %label_20
  %op14 = load i32, i32* @n
  %op15 = load i32, i32* @m
  %op16 = call i32 @knapsack(i32 %op14, i32 %op15)
  call void @output(i32 %op16)
  ret i32 0
label_exit:                                                ; preds = %label_19
  call void @neg_idx_except()
  ret i32 0
label_22:                                                ; preds = %label_19
  %op17 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op12
  store i32 %op10, i32* %op17
  %op18 = add i32 %op12, 1
  br label %label_20
label19:                                                ; preds = %label_entry
  %op10 = sub i32 0, 1
  br label %label_20
}
