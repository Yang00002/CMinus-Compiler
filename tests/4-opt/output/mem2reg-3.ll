; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/mem2reg/mem2reg-3.cminus"

@matrix = global [20000000 x i32] zeroinitializer
@ad = global [100000 x i32] zeroinitializer
@len = global i32 0
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @readarray() {
label_entry:
  br label %label_2
label_1:                                                ; preds = %label_2
  %op0 = call i32 @input()
  %op1 = icmp sge i32 %op2, 0
  br i1 %op1, label %label_4, label %label_exit
label_2:                                                ; preds = %label_entry, %label_4
  %op2 = phi i32 [ 0, %label_entry ], [ %op6, %label_4 ]
  %op3 = load i32, i32* @len
  %op4 = icmp slt i32 %op2, %op3
  br i1 %op4, label %label_1, label %label_3
label_3:                                                ; preds = %label_2
  ret void
label_exit:                                                ; preds = %label_1
  call void @neg_idx_except()
  ret void
label_4:                                                ; preds = %label_1
  %op5 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op2
  store i32 %op0, i32* %op5
  %op6 = add i32 %op2, 1
  br label %label_2
}
define i32 @transpose(i32 %arg0, i32* %arg1, i32 %arg2) {
label_entry:
  %op3 = sdiv i32 %arg0, %arg2
  br label %label_6
label_5:                                                ; preds = %label_6
  br label %label32
label_6:                                                ; preds = %label_entry, %label_10
  %op4 = phi i32 [ 0, %label_entry ], [ %op10, %label_10 ]
  %op5 = icmp slt i32 %op4, %op3
  br i1 %op5, label %label_5, label %label_7
label_7:                                                ; preds = %label_6
  %op6 = sub i32 0, 1
  ret i32 %op6
label_8:                                                ; preds = %label_9
  %op7 = icmp slt i32 %op4, %op8
  br i1 %op7, label %label_11, label %label_12
label_9:                                                ; preds = %label_13, %label32
  %op8 = phi i32 [ 0, %label32 ], [ %op15, %label_13 ]
  %op9 = icmp slt i32 %op8, %arg2
  br i1 %op9, label %label_8, label %label_10
label_10:                                                ; preds = %label_9
  %op10 = add i32 %op4, 1
  br label %label_6
label_11:                                                ; preds = %label_8
  %op11 = add i32 %op8, 1
  br label %label_13
label_12:                                                ; preds = %label_8
  %op13 = add i32 %op12, %op8
  %op14 = icmp sge i32 %op13, 0
  br i1 %op14, label %label_14, label %label_exit
label_13:                                                ; preds = %label_11, %label_17
  %op15 = phi i32 [ %op11, %label_11 ], [ %op31, %label_17 ]
  br label %label_9
label_exit:                                                ; preds = %label_12, %label_14, %label_15, %label_16
  call void @neg_idx_except()
  ret i32 0
label_14:                                                ; preds = %label_12
  %op16 = getelementptr i32, i32* %arg1, i32 %op13
  %op17 = load i32, i32* %op16
  %op19 = add i32 %op18, %op8
  %op20 = icmp sge i32 %op19, 0
  br i1 %op20, label %label_15, label %label_exit
label_15:                                                ; preds = %label_14
  %op21 = getelementptr i32, i32* %arg1, i32 %op19
  %op22 = load i32, i32* %op21
  %op23 = mul i32 %op8, %op3
  %op24 = add i32 %op23, %op4
  %op25 = icmp sge i32 %op24, 0
  br i1 %op25, label %label_16, label %label_exit
label_16:                                                ; preds = %label_15
  %op26 = getelementptr i32, i32* %arg1, i32 %op24
  store i32 %op22, i32* %op26
  %op28 = add i32 %op27, %op8
  %op29 = icmp sge i32 %op28, 0
  br i1 %op29, label %label_17, label %label_exit
label_17:                                                ; preds = %label_16
  %op30 = getelementptr i32, i32* %arg1, i32 %op28
  store i32 %op17, i32* %op30
  %op31 = add i32 %op8, 1
  br label %label_13
label32:                                                ; preds = %label_5
  %op12 = mul i32 %op4, %arg2
  %op18 = mul i32 %op4, %arg2
  %op27 = mul i32 %op4, %arg2
  br label %label_9
}
define i32 @main() {
label_entry:
  %op0 = call i32 @input()
  %op1 = call i32 @input()
  store i32 %op1, i32* @len
  call void @readarray()
  br label %label_19
label_18:                                                ; preds = %label_19
  %op2 = icmp sge i32 %op3, 0
  br i1 %op2, label %label_21, label %label_exit
label_19:                                                ; preds = %label_entry, %label_21
  %op3 = phi i32 [ 0, %label_entry ], [ %op6, %label_21 ]
  %op4 = icmp slt i32 %op3, %op0
  br i1 %op4, label %label_18, label %label_20
label_20:                                                ; preds = %label_19
  br label %label30
label_exit:                                                ; preds = %label_18, %label_22, %label_26
  call void @neg_idx_except()
  ret i32 0
label_21:                                                ; preds = %label_18
  %op5 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op3
  store i32 %op3, i32* %op5
  %op6 = add i32 %op3, 1
  br label %label_19
label_22:                                                ; preds = %label_23
  %op8 = icmp sge i32 %op9, 0
  br i1 %op8, label %label_25, label %label_exit
label_23:                                                ; preds = %label_25, %label30
  %op9 = phi i32 [ 0, %label30 ], [ %op15, %label_25 ]
  %op10 = load i32, i32* @len
  %op11 = icmp slt i32 %op9, %op10
  br i1 %op11, label %label_22, label %label_24
label_24:                                                ; preds = %label_23
  br label %label_27
label_25:                                                ; preds = %label_22
  %op12 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op9
  %op13 = load i32, i32* %op12
  %op14 = call i32 @transpose(i32 %op0, i32* %op7, i32 %op13)
  %op15 = add i32 %op9, 1
  br label %label_23
label_26:                                                ; preds = %label_27
  %op16 = mul i32 %op19, %op19
  %op17 = icmp sge i32 %op19, 0
  br i1 %op17, label %label_29, label %label_exit
label_27:                                                ; preds = %label_24, %label_29
  %op18 = phi i32 [ 0, %label_24 ], [ %op26, %label_29 ]
  %op19 = phi i32 [ 0, %label_24 ], [ %op27, %label_29 ]
  %op20 = load i32, i32* @len
  %op21 = icmp slt i32 %op19, %op20
  br i1 %op21, label %label_26, label %label_28
label_28:                                                ; preds = %label_27
  %op22 = icmp slt i32 %op18, 0
  br i1 %op22, label %label_30, label %label_31
label_29:                                                ; preds = %label_26
  %op23 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op19
  %op24 = load i32, i32* %op23
  %op25 = mul i32 %op16, %op24
  %op26 = add i32 %op18, %op25
  %op27 = add i32 %op19, 1
  br label %label_27
label_30:                                                ; preds = %label_28
  %op28 = sub i32 0, %op18
  br label %label_31
label_31:                                                ; preds = %label_28, %label_30
  %op29 = phi i32 [ %op18, %label_28 ], [ %op28, %label_30 ]
  call void @output(i32 %op29)
  ret i32 0
label30:                                                ; preds = %label_20
  %op7 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
  br label %label_23
}
