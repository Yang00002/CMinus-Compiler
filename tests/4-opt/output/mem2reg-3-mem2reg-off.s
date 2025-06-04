# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl matrix
	.type matrix, @object
	.size matrix, 80000000
matrix:
	.space 80000000
	.globl ad
	.type ad, @object
	.size ad, 400000
ad:
	.space 400000
	.globl len
	.type len, @object
	.size len, 4
len:
	.space 4
	.text
	.globl readarray
	.type readarray, @function
readarray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.readarray_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_2
	b .readarray_label_2
.readarray_label_1:
# %op1 = call i32 @input()
	bl input
	st.w $a0, $fp, -32
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# %op3 = icmp sge i32 %op2, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -37
# br i1 %op3, label %label_4, label %label_exit
	ld.b $t0, $fp, -37
	bnez $t0, .readarray_label_4
	beqz $t0, .readarray_label_exit
.readarray_label_2:
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -41
# %op5 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -45
# %op6 = icmp slt i32 %op4, %op5
	ld.w $t0, $fp, -41
	ld.w $t1, $fp, -45
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -46
# br i1 %op6, label %label_1, label %label_3
	ld.b $t0, $fp, -46
	bnez $t0, .readarray_label_1
	beqz $t0, .readarray_label_3
.readarray_label_3:
# ret void
	addi.w $a0, $zero, 0
	b readarrayEnd__Label
.readarray_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret void
	addi.w $a0, $zero, 0
	b readarrayEnd__Label
.readarray_label_4:
# %op7 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op2
	la.local $t0, ad
	ld.w $t1, $fp, -36
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -54
# store i32 %op1, i32* %op7
	ld.d $t0, $fp, -54
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -58
# %op9 = add i32 %op8, 1
	ld.w $t0, $fp, -58
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -62
# store i32 %op9, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -62
	st.w $t1, $t0, 0
# br label %label_2
	b .readarray_label_2
readarrayEnd__Label:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -304
	st.w $a0, $fp, -20
	st.d $a1, $fp, -28
	st.w $a2, $fp, -32
.transpose_label_entry:
# %op3 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# store i32 %arg0, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -56
	st.d $t0, $fp, -52
# store i32 %arg2, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op5 = alloca i32
	addi.d $t0, $fp, -68
	st.d $t0, $fp, -64
# %op6 = alloca i32
	addi.d $t0, $fp, -80
	st.d $t0, $fp, -76
# %op7 = alloca i32
	addi.d $t0, $fp, -92
	st.d $t0, $fp, -88
# %op8 = alloca i32
	addi.d $t0, $fp, -104
	st.d $t0, $fp, -100
# %op9 = load i32, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -108
# %op10 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -112
# %op11 = sdiv i32 %op9, %op10
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -112
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# store i32 %op11, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -116
	st.w $t1, $t0, 0
# store i32 0, i32* %op6
	ld.d $t0, $fp, -76
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op7
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_6
	b .transpose_label_6
.transpose_label_5:
# store i32 0, i32* %op7
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_9
	b .transpose_label_9
.transpose_label_6:
# %op12 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -120
# %op13 = load i32, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -124
# %op14 = icmp slt i32 %op12, %op13
	ld.w $t0, $fp, -120
	ld.w $t1, $fp, -124
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -125
# br i1 %op14, label %label_5, label %label_7
	ld.b $t0, $fp, -125
	bnez $t0, .transpose_label_5
	beqz $t0, .transpose_label_7
.transpose_label_7:
# %op15 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# ret i32 %op15
	ld.w $a0, $fp, -129
	b transposeEnd__Label
.transpose_label_8:
# %op16 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -133
# %op17 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -137
# %op18 = icmp slt i32 %op16, %op17
	ld.w $t0, $fp, -133
	ld.w $t1, $fp, -137
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -138
# br i1 %op18, label %label_11, label %label_12
	ld.b $t0, $fp, -138
	bnez $t0, .transpose_label_11
	beqz $t0, .transpose_label_12
.transpose_label_9:
# %op19 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -142
# %op20 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -146
# %op21 = icmp slt i32 %op19, %op20
	ld.w $t0, $fp, -142
	ld.w $t1, $fp, -146
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -147
# br i1 %op21, label %label_8, label %label_10
	ld.b $t0, $fp, -147
	bnez $t0, .transpose_label_8
	beqz $t0, .transpose_label_10
.transpose_label_10:
# %op22 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -151
# %op23 = add i32 %op22, 1
	ld.w $t0, $fp, -151
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -155
# store i32 %op23, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t1, $fp, -155
	st.w $t1, $t0, 0
# br label %label_6
	b .transpose_label_6
.transpose_label_11:
# %op24 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -159
# %op25 = add i32 %op24, 1
	ld.w $t0, $fp, -159
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -163
# store i32 %op25, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -163
	st.w $t1, $t0, 0
# br label %label_13
	b .transpose_label_13
.transpose_label_12:
# %op26 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -167
# %op27 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -171
# %op28 = mul i32 %op26, %op27
	ld.w $t0, $fp, -167
	ld.w $t1, $fp, -171
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -175
# %op29 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -179
# %op30 = add i32 %op28, %op29
	ld.w $t0, $fp, -175
	ld.w $t1, $fp, -179
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -183
# %op31 = icmp sge i32 %op30, 0
	ld.w $t0, $fp, -183
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -184
# br i1 %op31, label %label_14, label %label_exit
	ld.b $t0, $fp, -184
	bnez $t0, .transpose_label_14
	beqz $t0, .transpose_label_exit
.transpose_label_13:
# br label %label_9
	b .transpose_label_9
.transpose_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b transposeEnd__Label
.transpose_label_14:
# %op32 = getelementptr i32, i32* %arg1, i32 %op30
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -183
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -192
# %op33 = load i32, i32* %op32
	ld.d $t0, $fp, -192
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -196
# store i32 %op33, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t1, $fp, -196
	st.w $t1, $t0, 0
# %op34 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -200
# %op35 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -204
# %op36 = mul i32 %op34, %op35
	ld.w $t0, $fp, -200
	ld.w $t1, $fp, -204
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op37 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -212
# %op38 = add i32 %op36, %op37
	ld.w $t0, $fp, -208
	ld.w $t1, $fp, -212
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# %op39 = icmp sge i32 %op38, 0
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -217
# br i1 %op39, label %label_15, label %label_exit
	ld.b $t0, $fp, -217
	bnez $t0, .transpose_label_15
	beqz $t0, .transpose_label_exit
.transpose_label_15:
# %op40 = getelementptr i32, i32* %arg1, i32 %op38
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -216
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -225
# %op41 = load i32, i32* %op40
	ld.d $t0, $fp, -225
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -229
# %op42 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -233
# %op43 = load i32, i32* %op5
	ld.d $t0, $fp, -64
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -237
# %op44 = mul i32 %op42, %op43
	ld.w $t0, $fp, -233
	ld.w $t1, $fp, -237
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -241
# %op45 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -245
# %op46 = add i32 %op44, %op45
	ld.w $t0, $fp, -241
	ld.w $t1, $fp, -245
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -249
# %op47 = icmp sge i32 %op46, 0
	ld.w $t0, $fp, -249
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -250
# br i1 %op47, label %label_16, label %label_exit
	ld.b $t0, $fp, -250
	bnez $t0, .transpose_label_16
	beqz $t0, .transpose_label_exit
.transpose_label_16:
# %op48 = getelementptr i32, i32* %arg1, i32 %op46
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -249
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -258
# store i32 %op41, i32* %op48
	ld.d $t0, $fp, -258
	ld.w $t1, $fp, -229
	st.w $t1, $t0, 0
# %op49 = load i32, i32* %op8
	ld.d $t0, $fp, -100
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -262
# %op50 = load i32, i32* %op6
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -266
# %op51 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -270
# %op52 = mul i32 %op50, %op51
	ld.w $t0, $fp, -266
	ld.w $t1, $fp, -270
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -274
# %op53 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -278
# %op54 = add i32 %op52, %op53
	ld.w $t0, $fp, -274
	ld.w $t1, $fp, -278
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -282
# %op55 = icmp sge i32 %op54, 0
	ld.w $t0, $fp, -282
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -283
# br i1 %op55, label %label_17, label %label_exit
	ld.b $t0, $fp, -283
	bnez $t0, .transpose_label_17
	beqz $t0, .transpose_label_exit
.transpose_label_17:
# %op56 = getelementptr i32, i32* %arg1, i32 %op54
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -282
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -291
# store i32 %op49, i32* %op56
	ld.d $t0, $fp, -291
	ld.w $t1, $fp, -262
	st.w $t1, $t0, 0
# %op57 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -295
# %op58 = add i32 %op57, 1
	ld.w $t0, $fp, -295
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -299
# store i32 %op58, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -299
	st.w $t1, $t0, 0
# br label %label_13
	b .transpose_label_13
transposeEnd__Label:
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
	addi.d $sp, $sp, -224
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# %op2 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# %op3 = call i32 @input()
	bl input
	st.w $a0, $fp, -56
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
# %op4 = call i32 @input()
	bl input
	st.w $a0, $fp, -60
# store i32 %op4, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_19
	b .main_label_19
.main_label_18:
# %op5 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -68
# %op7 = icmp sge i32 %op6, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -69
# br i1 %op7, label %label_21, label %label_exit
	ld.b $t0, $fp, -69
	bnez $t0, .main_label_21
	beqz $t0, .main_label_exit
.main_label_19:
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -77
# %op10 = icmp slt i32 %op8, %op9
	ld.w $t0, $fp, -73
	ld.w $t1, $fp, -77
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -78
# br i1 %op10, label %label_18, label %label_20
	ld.b $t0, $fp, -78
	bnez $t0, .main_label_18
	beqz $t0, .main_label_20
.main_label_20:
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_23
	b .main_label_23
.main_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_21:
# %op11 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op6
	la.local $t0, matrix
	ld.w $t1, $fp, -68
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -86
# store i32 %op5, i32* %op11
	ld.d $t0, $fp, -86
	ld.w $t1, $fp, -64
	st.w $t1, $t0, 0
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -90
# %op13 = add i32 %op12, 1
	ld.w $t0, $fp, -90
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -94
# store i32 %op13, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -94
	st.w $t1, $t0, 0
# br label %label_19
	b .main_label_19
.main_label_22:
# %op14 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -98
# %op15 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -106
# %op16 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -110
# %op17 = icmp sge i32 %op16, 0
	ld.w $t0, $fp, -110
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -111
# br i1 %op17, label %label_25, label %label_exit
	ld.b $t0, $fp, -111
	bnez $t0, .main_label_25
	beqz $t0, .main_label_exit
.main_label_23:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -115
# %op19 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -119
# %op20 = icmp slt i32 %op18, %op19
	ld.w $t0, $fp, -115
	ld.w $t1, $fp, -119
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -120
# br i1 %op20, label %label_22, label %label_24
	ld.b $t0, $fp, -120
	bnez $t0, .main_label_22
	beqz $t0, .main_label_24
.main_label_24:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_27
	b .main_label_27
.main_label_25:
# %op21 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op16
	la.local $t0, ad
	ld.w $t1, $fp, -110
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# %op22 = load i32, i32* %op21
	ld.d $t0, $fp, -128
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -132
# %op23 = call i32 @transpose(i32 %op14, i32* %op15, i32 %op22)
	ld.w $a0, $fp, -98
	ld.d $a1, $fp, -106
	ld.w $a2, $fp, -132
	bl transpose
	st.w $a0, $fp, -136
# %op24 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -140
# %op25 = add i32 %op24, 1
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# store i32 %op25, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -144
	st.w $t1, $t0, 0
# br label %label_23
	b .main_label_23
.main_label_26:
# %op26 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -148
# %op27 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -152
# %op28 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -156
# %op29 = mul i32 %op27, %op28
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op30 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -164
# %op31 = icmp sge i32 %op30, 0
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -165
# br i1 %op31, label %label_29, label %label_exit
	ld.b $t0, $fp, -165
	bnez $t0, .main_label_29
	beqz $t0, .main_label_exit
.main_label_27:
# %op32 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -169
# %op33 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -173
# %op34 = icmp slt i32 %op32, %op33
	ld.w $t0, $fp, -169
	ld.w $t1, $fp, -173
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -174
# br i1 %op34, label %label_26, label %label_28
	ld.b $t0, $fp, -174
	bnez $t0, .main_label_26
	beqz $t0, .main_label_28
.main_label_28:
# %op35 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -178
# %op36 = icmp slt i32 %op35, 0
	ld.w $t0, $fp, -178
	addi.w $t1, $zero, 0
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -179
# br i1 %op36, label %label_30, label %label_31
	ld.b $t0, $fp, -179
	bnez $t0, .main_label_30
	beqz $t0, .main_label_31
.main_label_29:
# %op37 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op30
	la.local $t0, matrix
	ld.w $t1, $fp, -164
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -187
# %op38 = load i32, i32* %op37
	ld.d $t0, $fp, -187
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -191
# %op39 = mul i32 %op29, %op38
	ld.w $t0, $fp, -160
	ld.w $t1, $fp, -191
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -195
# %op40 = add i32 %op26, %op39
	ld.w $t0, $fp, -148
	ld.w $t1, $fp, -195
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -199
# store i32 %op40, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -199
	st.w $t1, $t0, 0
# %op41 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -203
# %op42 = add i32 %op41, 1
	ld.w $t0, $fp, -203
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -207
# store i32 %op42, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -207
	st.w $t1, $t0, 0
# br label %label_27
	b .main_label_27
.main_label_30:
# %op43 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -211
# %op44 = sub i32 0, %op43
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -211
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -215
# store i32 %op44, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -215
	st.w $t1, $t0, 0
# br label %label_31
	b .main_label_31
.main_label_31:
# %op45 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -219
# call void @output(i32 %op45)
	ld.w $a0, $fp, -219
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 224
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
