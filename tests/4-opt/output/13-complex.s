# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = icmp sgt i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -25
# br i1 %op2, label %label_1, label %label_2
	ld.b $t0, $fp, -25
	bnez $t0, .max_label_1
	beqz $t0, .max_label_2
.max_label_1:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b maxEnd__Label
.max_label_2:
# ret i32 %arg1
	ld.w $a0, $fp, -24
	b maxEnd__Label
maxEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = icmp sle i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t1, $t1, 1
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -25
# br i1 %op2, label %label_4, label %label_5
	ld.b $t0, $fp, -25
	bnez $t0, .knapsack_label_4
	beqz $t0, .knapsack_label_5
.knapsack_label_4:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsackEnd__Label
.knapsack_label_5:
# %op3 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -26
# br i1 %op3, label %label_6, label %label_7
	ld.b $t0, $fp, -26
	bnez $t0, .knapsack_label_6
	beqz $t0, .knapsack_label_7
.knapsack_label_6:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsackEnd__Label
.knapsack_label_7:
# %op4 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -30
# %op5 = add i32 %op4, %arg1
	ld.w $t0, $fp, -30
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# %op6 = icmp sge i32 %op5, 0
	ld.w $t0, $fp, -34
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -35
# br i1 %op6, label %label_8, label %label_exit
	ld.b $t0, $fp, -35
	bnez $t0, .knapsack_label_8
	beqz $t0, .knapsack_label_exit
.knapsack_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsackEnd__Label
.knapsack_label_8:
# %op7 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op5
	la.local $t0, dp
	ld.w $t1, $fp, -34
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -43
# %op8 = load i32, i32* %op7
	ld.d $t0, $fp, -43
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -47
# %op9 = icmp sge i32 %op8, 0
	ld.w $t0, $fp, -47
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -48
# br i1 %op9, label %label_9, label %label_10
	ld.b $t0, $fp, -48
	bnez $t0, .knapsack_label_9
	beqz $t0, .knapsack_label_10
.knapsack_label_9:
# %op10 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op11 = add i32 %op10, %arg1
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op12 = icmp sge i32 %op11, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -57
# br i1 %op12, label %label_11, label %label_exit
	ld.b $t0, $fp, -57
	bnez $t0, .knapsack_label_11
	beqz $t0, .knapsack_label_exit
.knapsack_label_10:
# %op13 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op14 = icmp sge i32 %op13, 0
	ld.w $t0, $fp, -61
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -62
# br i1 %op14, label %label_12, label %label_exit
	ld.b $t0, $fp, -62
	bnez $t0, .knapsack_label_12
	beqz $t0, .knapsack_label_exit
.knapsack_label_11:
# %op15 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op11
	la.local $t0, dp
	ld.w $t1, $fp, -56
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -70
# %op16 = load i32, i32* %op15
	ld.d $t0, $fp, -70
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -74
# ret i32 %op16
	ld.w $a0, $fp, -74
	b knapsackEnd__Label
.knapsack_label_12:
# %op17 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op13
	la.local $t0, w
	ld.w $t1, $fp, -61
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -82
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -82
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -86
# %op19 = icmp slt i32 %arg1, %op18
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -86
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -87
# br i1 %op19, label %label_13, label %label_14
	ld.b $t0, $fp, -87
	bnez $t0, .knapsack_label_13
	beqz $t0, .knapsack_label_14
.knapsack_label_13:
# %op20 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -91
# %op21 = call i32 @knapsack(i32 %op20, i32 %arg1)
	ld.w $a0, $fp, -91
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -95
# br label %label_15
	ld.w $a0, $fp, -95
	st.w $a0, $fp, -116
	b .knapsack_label_15
.knapsack_label_14:
# %op22 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -99
# %op23 = call i32 @knapsack(i32 %op22, i32 %arg1)
	ld.w $a0, $fp, -99
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -103
# %op24 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op25 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -111
# %op26 = icmp sge i32 %op25, 0
	ld.w $t0, $fp, -111
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -112
# br i1 %op26, label %label_16, label %label_exit
	ld.b $t0, $fp, -112
	bnez $t0, .knapsack_label_16
	beqz $t0, .knapsack_label_exit
.knapsack_label_15:
# %op27 = phi i32 [ %op21, %label_13 ], [ %op40, %label_17 ]
# %op28 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op29 = add i32 %op28, %arg1
	ld.w $t0, $fp, -120
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# %op30 = icmp sge i32 %op29, 0
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -125
# br i1 %op30, label %label_18, label %label_exit
	ld.b $t0, $fp, -125
	bnez $t0, .knapsack_label_18
	beqz $t0, .knapsack_label_exit
.knapsack_label_16:
# %op31 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op25
	la.local $t0, w
	ld.w $t1, $fp, -111
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -133
# %op32 = load i32, i32* %op31
	ld.d $t0, $fp, -133
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -137
# %op33 = sub i32 %arg1, %op32
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -137
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -141
# %op34 = call i32 @knapsack(i32 %op24, i32 %op33)
	ld.w $a0, $fp, -107
	ld.w $a1, $fp, -141
	bl knapsack
	st.w $a0, $fp, -145
# %op35 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -149
# %op36 = icmp sge i32 %op35, 0
	ld.w $t0, $fp, -149
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -150
# br i1 %op36, label %label_17, label %label_exit
	ld.b $t0, $fp, -150
	bnez $t0, .knapsack_label_17
	beqz $t0, .knapsack_label_exit
.knapsack_label_17:
# %op37 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op35
	la.local $t0, v
	ld.w $t1, $fp, -149
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -158
# %op38 = load i32, i32* %op37
	ld.d $t0, $fp, -158
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -162
# %op39 = add i32 %op34, %op38
	ld.w $t0, $fp, -145
	ld.w $t1, $fp, -162
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -166
# %op40 = call i32 @max(i32 %op23, i32 %op39)
	ld.w $a0, $fp, -103
	ld.w $a1, $fp, -166
	bl max
	st.w $a0, $fp, -170
# br label %label_15
	ld.w $a0, $fp, -170
	st.w $a0, $fp, -116
	b .knapsack_label_15
.knapsack_label_18:
# %op41 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op29
	la.local $t0, dp
	ld.w $t1, $fp, -124
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -178
# store i32 %op27, i32* %op41
	ld.d $t0, $fp, -178
	ld.w $t1, $fp, -116
	st.w $t1, $t0, 0
# ret i32 %op27
	ld.w $a0, $fp, -116
	b knapsackEnd__Label
knapsackEnd__Label:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op0 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -24
# store i32 2, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op1 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t1, $zero, 1
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -32
# store i32 2, i32* %op1
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t1, $zero, 2
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -40
# store i32 6, i32* %op2
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t1, $zero, 3
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# store i32 5, i32* %op3
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -56
# store i32 4, i32* %op4
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op5 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -64
# store i32 6, i32* %op5
	ld.d $t0, $fp, -64
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op6 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t1, $zero, 1
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -72
# store i32 3, i32* %op6
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op7 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t1, $zero, 2
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -80
# store i32 5, i32* %op7
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op8 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t1, $zero, 3
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -88
# store i32 4, i32* %op8
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op9 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# store i32 6, i32* %op9
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label19
	b .main_label19
.main_label_19:
# %op11 = icmp sge i32 %op12, 0
	ld.w $t0, $fp, -101
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -97
# br i1 %op11, label %label_22, label %label_exit
	ld.b $t0, $fp, -97
	bnez $t0, .main_label_22
	beqz $t0, .main_label_exit
.main_label_20:
# %op12 = phi i32 [ 0, %label19 ], [ %op18, %label_22 ]
# %op13 = icmp slt i32 %op12, 66
	ld.w $t0, $fp, -101
	addi.w $t1, $zero, 66
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -102
# br i1 %op13, label %label_19, label %label_21
	ld.b $t0, $fp, -102
	bnez $t0, .main_label_19
	beqz $t0, .main_label_21
.main_label_21:
# %op14 = load i32, i32* @n
	la.local $t0, n
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -106
# %op15 = load i32, i32* @m
	la.local $t0, m
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -110
# %op16 = call i32 @knapsack(i32 %op14, i32 %op15)
	ld.w $a0, $fp, -106
	ld.w $a1, $fp, -110
	bl knapsack
	st.w $a0, $fp, -114
# call void @output(i32 %op16)
	ld.w $a0, $fp, -114
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_22:
# %op17 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op12
	la.local $t0, dp
	ld.w $t1, $fp, -101
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -122
# store i32 %op10, i32* %op17
	ld.d $t0, $fp, -122
	ld.w $t1, $fp, -130
	st.w $t1, $t0, 0
# %op18 = add i32 %op12, 1
	ld.w $t0, $fp, -101
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -126
# br label %label_20
	ld.w $a0, $fp, -126
	st.w $a0, $fp, -101
	b .main_label_20
.main_label19:
# %op10 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -130
# br label %label_20
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -101
	b .main_label_20
mainEnd__Label:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
