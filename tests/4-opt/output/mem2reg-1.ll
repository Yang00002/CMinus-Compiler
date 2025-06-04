; ModuleID = 'cminus'
source_filename = "/home/yang/lab1/2024ustc-jianmu-compiler/tests/4-opt/testcases/mem2reg/mem2reg-1.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = call i32 @input()
  br label %label30
label_1:                                                ; preds = %label_2
  %op26 = add i32 %op27, 1
  br label %label_2
label_2:                                                ; preds = %label_1, %label30
  %op27 = phi i32 [ 0, %label30 ], [ %op26, %label_1 ]
  %op28 = phi i32 [ 0, %label30 ], [ %op25, %label_1 ]
  %op29 = icmp slt i32 %op27, %op0
  br i1 %op29, label %label_1, label %label_3
label_3:                                                ; preds = %label_2
  call void @output(i32 %op28)
  ret void
label30:                                                ; preds = %label_entry
  %op1 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
  %op2 = fmul float %op1, 0x4002aa9940000000
  %op3 = fmul float %op2, 0x4011781d80000000
  %op4 = fmul float %op3, 0x401962ac40000000
  %op5 = fptosi float %op4 to i32
  %op6 = mul i32 %op5, %op5
  %op7 = mul i32 %op6, %op5
  %op8 = mul i32 %op7, %op5
  %op9 = mul i32 %op8, %op5
  %op10 = mul i32 %op9, %op5
  %op11 = mul i32 %op10, %op10
  %op12 = mul i32 %op11, %op10
  %op13 = mul i32 %op12, %op10
  %op14 = mul i32 %op13, %op10
  %op15 = mul i32 %op14, %op10
  %op16 = mul i32 %op15, %op15
  %op17 = mul i32 %op16, %op15
  %op18 = mul i32 %op17, %op15
  %op19 = mul i32 %op18, %op15
  %op20 = mul i32 %op19, %op15
  %op21 = mul i32 %op20, %op20
  %op22 = mul i32 %op21, %op20
  %op23 = mul i32 %op22, %op20
  %op24 = mul i32 %op23, %op20
  %op25 = mul i32 %op24, %op20
  br label %label_2
}
