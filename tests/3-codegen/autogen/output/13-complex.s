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
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -44
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op6 = icmp sgt i32 %op4, %op5
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -56
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -57
# br i1 %op6, label %label_1, label %label_2
	ld.b $t0, $fp, -57
	bnez $t0, .max_label_1
	beqz $t0, .max_label_2
.max_label_1:
# %op7 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# ret i32 %op7
	ld.w $a0, $fp, -61
	b maxEnd__Label
.max_label_2:
# %op8 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# ret i32 %op8
	ld.w $a0, $fp, -65
	b maxEnd__Label
.max_label_3:
# ret i32 0
	addi.w $a0, $zero, 0
	b maxEnd__Label
maxEnd__Label:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -304
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -44
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op6 = icmp sle i32 %op5, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	addi.w $t1, $t1, 1
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -65
# br i1 %op6, label %label_4, label %label_5
	ld.b $t0, $fp, -65
	bnez $t0, .knapsack_label_4
	beqz $t0, .knapsack_label_5
.knapsack_label_4:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsackEnd__Label
.knapsack_label_5:
# %op7 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# %op8 = icmp eq i32 %op7, 0
	ld.w $t0, $fp, -69
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -70
# br i1 %op8, label %label_6, label %label_7
	ld.b $t0, $fp, -70
	bnez $t0, .knapsack_label_6
	beqz $t0, .knapsack_label_7
.knapsack_label_6:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsackEnd__Label
.knapsack_label_7:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -74
# %op10 = mul i32 %op9, 11
	ld.w $t0, $fp, -74
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -78
# %op11 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -82
# %op12 = add i32 %op10, %op11
	ld.w $t0, $fp, -78
	ld.w $t1, $fp, -82
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -86
# %op13 = icmp sge i32 %op12, 0
	ld.w $t0, $fp, -86
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -87
# br i1 %op13, label %label_8, label %label_exit
	ld.b $t0, $fp, -87
	bnez $t0, .knapsack_label_8
	beqz $t0, .knapsack_label_exit
.knapsack_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsackEnd__Label
.knapsack_label_8:
# %op14 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op12
	la.local $t0, dp
	ld.w $t1, $fp, -86
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -95
# %op15 = load i32, i32* %op14
	ld.d $t0, $fp, -95
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -99
# %op16 = icmp sge i32 %op15, 0
	ld.w $t0, $fp, -99
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -100
# br i1 %op16, label %label_9, label %label_10
	ld.b $t0, $fp, -100
	bnez $t0, .knapsack_label_9
	beqz $t0, .knapsack_label_10
.knapsack_label_9:
# %op17 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -104
# %op18 = mul i32 %op17, 11
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op19 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -112
# %op20 = add i32 %op18, %op19
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -112
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op21 = icmp sge i32 %op20, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -117
# br i1 %op21, label %label_11, label %label_exit
	ld.b $t0, $fp, -117
	bnez $t0, .knapsack_label_11
	beqz $t0, .knapsack_label_exit
.knapsack_label_10:
# %op22 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -121
# %op23 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -125
# %op24 = sub i32 %op23, 1
	ld.w $t0, $fp, -125
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# %op25 = icmp sge i32 %op24, 0
	ld.w $t0, $fp, -129
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -130
# br i1 %op25, label %label_12, label %label_exit
	ld.b $t0, $fp, -130
	bnez $t0, .knapsack_label_12
	beqz $t0, .knapsack_label_exit
.knapsack_label_11:
# %op26 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op20
	la.local $t0, dp
	ld.w $t1, $fp, -116
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -138
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -138
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -142
# ret i32 %op27
	ld.w $a0, $fp, -142
	b knapsackEnd__Label
.knapsack_label_12:
# %op28 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op24
	la.local $t0, w
	ld.w $t1, $fp, -129
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -150
# %op29 = load i32, i32* %op28
	ld.d $t0, $fp, -150
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -154
# %op30 = icmp slt i32 %op22, %op29
	ld.w $t0, $fp, -121
	ld.w $t1, $fp, -154
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -155
# br i1 %op30, label %label_13, label %label_14
	ld.b $t0, $fp, -155
	bnez $t0, .knapsack_label_13
	beqz $t0, .knapsack_label_14
.knapsack_label_13:
# %op31 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -159
# %op32 = sub i32 %op31, 1
	ld.w $t0, $fp, -159
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -163
# %op33 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -167
# %op34 = call i32 @knapsack(i32 %op32, i32 %op33)
	ld.w $a0, $fp, -163
	ld.w $a1, $fp, -167
	bl knapsack
	st.w $a0, $fp, -171
# store i32 %op34, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -171
	st.w $t1, $t0, 0
# br label %label_15
	b .knapsack_label_15
.knapsack_label_14:
# %op35 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -175
# %op36 = sub i32 %op35, 1
	ld.w $t0, $fp, -175
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -179
# %op37 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -183
# %op38 = call i32 @knapsack(i32 %op36, i32 %op37)
	ld.w $a0, $fp, -179
	ld.w $a1, $fp, -183
	bl knapsack
	st.w $a0, $fp, -187
# %op39 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -191
# %op40 = sub i32 %op39, 1
	ld.w $t0, $fp, -191
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -195
# %op41 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -199
# %op42 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -203
# %op43 = sub i32 %op42, 1
	ld.w $t0, $fp, -203
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -207
# %op44 = icmp sge i32 %op43, 0
	ld.w $t0, $fp, -207
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -208
# br i1 %op44, label %label_16, label %label_exit
	ld.b $t0, $fp, -208
	bnez $t0, .knapsack_label_16
	beqz $t0, .knapsack_label_exit
.knapsack_label_15:
# %op45 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -212
# %op46 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -216
# %op47 = mul i32 %op46, 11
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# %op48 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -224
# %op49 = add i32 %op47, %op48
	ld.w $t0, $fp, -220
	ld.w $t1, $fp, -224
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -228
# %op50 = icmp sge i32 %op49, 0
	ld.w $t0, $fp, -228
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -229
# br i1 %op50, label %label_18, label %label_exit
	ld.b $t0, $fp, -229
	bnez $t0, .knapsack_label_18
	beqz $t0, .knapsack_label_exit
.knapsack_label_16:
# %op51 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op43
	la.local $t0, w
	ld.w $t1, $fp, -207
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -237
# %op52 = load i32, i32* %op51
	ld.d $t0, $fp, -237
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -241
# %op53 = sub i32 %op41, %op52
	ld.w $t0, $fp, -199
	ld.w $t1, $fp, -241
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -245
# %op54 = call i32 @knapsack(i32 %op40, i32 %op53)
	ld.w $a0, $fp, -195
	ld.w $a1, $fp, -245
	bl knapsack
	st.w $a0, $fp, -249
# %op55 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -253
# %op56 = sub i32 %op55, 1
	ld.w $t0, $fp, -253
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -257
# %op57 = icmp sge i32 %op56, 0
	ld.w $t0, $fp, -257
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -258
# br i1 %op57, label %label_17, label %label_exit
	ld.b $t0, $fp, -258
	bnez $t0, .knapsack_label_17
	beqz $t0, .knapsack_label_exit
.knapsack_label_17:
# %op58 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op56
	la.local $t0, v
	ld.w $t1, $fp, -257
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -266
# %op59 = load i32, i32* %op58
	ld.d $t0, $fp, -266
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -270
# %op60 = add i32 %op54, %op59
	ld.w $t0, $fp, -249
	ld.w $t1, $fp, -270
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -274
# %op61 = call i32 @max(i32 %op38, i32 %op60)
	ld.w $a0, $fp, -187
	ld.w $a1, $fp, -274
	bl max
	st.w $a0, $fp, -278
# store i32 %op61, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -278
	st.w $t1, $t0, 0
# br label %label_15
	b .knapsack_label_15
.knapsack_label_18:
# %op62 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op49
	la.local $t0, dp
	ld.w $t1, $fp, -228
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -286
# store i32 %op45, i32* %op62
	ld.d $t0, $fp, -286
	ld.w $t1, $fp, -212
	st.w $t1, $t0, 0
# %op63 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -290
# ret i32 %op63
	ld.w $a0, $fp, -290
	b knapsackEnd__Label
knapsackEnd__Label:
	addi.d $sp, $sp, 304
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -160
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op1 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -36
# store i32 2, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t1, $zero, 1
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -44
# store i32 2, i32* %op2
	ld.d $t0, $fp, -44
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t1, $zero, 2
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -52
# store i32 6, i32* %op3
	ld.d $t0, $fp, -52
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t1, $zero, 3
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -60
# store i32 5, i32* %op4
	ld.d $t0, $fp, -60
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op5 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -68
# store i32 4, i32* %op5
	ld.d $t0, $fp, -68
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op6 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -76
# store i32 6, i32* %op6
	ld.d $t0, $fp, -76
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op7 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t1, $zero, 1
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -84
# store i32 3, i32* %op7
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op8 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t1, $zero, 2
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -92
# store i32 5, i32* %op8
	ld.d $t0, $fp, -92
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op9 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t1, $zero, 3
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -100
# store i32 4, i32* %op9
	ld.d $t0, $fp, -100
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op10 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -108
# store i32 6, i32* %op10
	ld.d $t0, $fp, -108
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label_20
	b .main_label_20
.main_label_19:
# %op11 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op12 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -116
# %op13 = icmp sge i32 %op12, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -117
# br i1 %op13, label %label_22, label %label_exit
	ld.b $t0, $fp, -117
	bnez $t0, .main_label_22
	beqz $t0, .main_label_exit
.main_label_20:
# %op14 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -121
# %op15 = icmp slt i32 %op14, 66
	ld.w $t0, $fp, -121
	addi.w $t1, $zero, 66
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -122
# br i1 %op15, label %label_19, label %label_21
	ld.b $t0, $fp, -122
	bnez $t0, .main_label_19
	beqz $t0, .main_label_21
.main_label_21:
# %op16 = load i32, i32* @n
	la.local $t0, n
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -126
# %op17 = load i32, i32* @m
	la.local $t0, m
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -130
# %op18 = call i32 @knapsack(i32 %op16, i32 %op17)
	ld.w $a0, $fp, -126
	ld.w $a1, $fp, -130
	bl knapsack
	st.w $a0, $fp, -134
# call void @output(i32 %op18)
	ld.w $a0, $fp, -134
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
# %op19 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op12
	la.local $t0, dp
	ld.w $t1, $fp, -116
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -142
# store i32 %op11, i32* %op19
	ld.d $t0, $fp, -142
	ld.w $t1, $fp, -112
	st.w $t1, $t0, 0
# %op20 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -146
# %op21 = add i32 %op20, 1
	ld.w $t0, $fp, -146
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -150
# store i32 %op21, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -150
	st.w $t1, $t0, 0
# br label %label_20
	b .main_label_20
mainEnd__Label:
	addi.d $sp, $sp, 160
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
