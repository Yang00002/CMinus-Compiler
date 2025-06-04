; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/testcases_general/20-gcd_array.cminus"

@x = global [1 x i32] zeroinitializer
@y = global [1 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @gcd(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp eq i32 %arg1, 0
  br i1 %op2, label %label_1, label %label_2
label_1:                                                ; preds = %label_entry
  ret i32 %arg0
label_2:                                                ; preds = %label_entry
  %op3 = sdiv i32 %arg0, %arg1
  %op4 = mul i32 %op3, %arg1
  %op5 = sub i32 %arg0, %op4
  %op6 = call i32 @gcd(i32 %arg1, i32 %op5)
  ret i32 %op6
}
define i32 @funArray(i32* %arg0, i32* %arg1) {
label_entry:
  %op2 = getelementptr i32, i32* %arg0, i32 0
  %op3 = load i32, i32* %op2
  %op4 = getelementptr i32, i32* %arg1, i32 0
  %op5 = load i32, i32* %op4
  %op6 = icmp slt i32 %op3, %op5
  br i1 %op6, label %label_4, label %label_5
label_4:                                                ; preds = %label_entry
  br label %label_5
label_5:                                                ; preds = %label_entry, %label_4
  %op7 = phi i32 [ %op5, %label_entry ], [ %op3, %label_4 ]
  %op8 = phi i32 [ %op3, %label_entry ], [ %op5, %label_4 ]
  %op9 = call i32 @gcd(i32 %op8, i32 %op7)
  ret i32 %op9
}
define i32 @main() {
label_entry:
  %op0 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
  store i32 90, i32* %op0
  %op1 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
  store i32 18, i32* %op1
  %op2 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
  %op3 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
  %op4 = call i32 @funArray(i32* %op2, i32* %op3)
  ret i32 %op4
}
