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
	addi.d $sp, $sp, -48
.readarray_label_entry:
# br label %label_2
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -25
	b .readarray_label_2
.readarray_label_1:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# %op1 = icmp sge i32 %op2, 0
	ld.w $t0, $fp, -25
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -21
# br i1 %op1, label %label_4, label %label_exit
	ld.b $t0, $fp, -21
	bnez $t0, .readarray_label_4
	beqz $t0, .readarray_label_exit
.readarray_label_2:
# %op2 = phi i32 [ 0, %label_entry ], [ %op6, %label_4 ]
# %op3 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -29
# %op4 = icmp slt i32 %op2, %op3
	ld.w $t0, $fp, -25
	ld.w $t1, $fp, -29
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -30
# br i1 %op4, label %label_1, label %label_3
	ld.b $t0, $fp, -30
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
# %op5 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op2
	la.local $t0, ad
	ld.w $t1, $fp, -25
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -38
# store i32 %op0, i32* %op5
	ld.d $t0, $fp, -38
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op6 = add i32 %op2, 1
	ld.w $t0, $fp, -25
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label_2
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -25
	b .readarray_label_2
readarrayEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
	st.w $a0, $fp, -20
	st.d $a1, $fp, -28
	st.w $a2, $fp, -32
.transpose_label_entry:
# %op3 = sdiv i32 %arg0, %arg2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -32
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# br label %label_6
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -40
	b .transpose_label_6
.transpose_label_5:
# br label %label32
	b .transpose_label32
.transpose_label_6:
# %op4 = phi i32 [ 0, %label_entry ], [ %op10, %label_10 ]
# %op5 = icmp slt i32 %op4, %op3
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -36
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -41
# br i1 %op5, label %label_5, label %label_7
	ld.b $t0, $fp, -41
	bnez $t0, .transpose_label_5
	beqz $t0, .transpose_label_7
.transpose_label_7:
# %op6 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -45
# ret i32 %op6
	ld.w $a0, $fp, -45
	b transposeEnd__Label
.transpose_label_8:
# %op7 = icmp slt i32 %op4, %op8
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -50
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -46
# br i1 %op7, label %label_11, label %label_12
	ld.b $t0, $fp, -46
	bnez $t0, .transpose_label_11
	beqz $t0, .transpose_label_12
.transpose_label_9:
# %op8 = phi i32 [ 0, %label32 ], [ %op15, %label_13 ]
# %op9 = icmp slt i32 %op8, %arg2
	ld.w $t0, $fp, -50
	ld.w $t1, $fp, -32
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -51
# br i1 %op9, label %label_8, label %label_10
	ld.b $t0, $fp, -51
	bnez $t0, .transpose_label_8
	beqz $t0, .transpose_label_10
.transpose_label_10:
# %op10 = add i32 %op4, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -55
# br label %label_6
	ld.w $a0, $fp, -55
	st.w $a0, $fp, -40
	b .transpose_label_6
.transpose_label_11:
# %op11 = add i32 %op8, 1
	ld.w $t0, $fp, -50
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -59
# br label %label_13
	ld.w $a0, $fp, -59
	st.w $a0, $fp, -68
	b .transpose_label_13
.transpose_label_12:
# %op13 = add i32 %op12, %op8
	ld.w $t0, $fp, -135
	ld.w $t1, $fp, -50
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -63
# %op14 = icmp sge i32 %op13, 0
	ld.w $t0, $fp, -63
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -64
# br i1 %op14, label %label_14, label %label_exit
	ld.b $t0, $fp, -64
	bnez $t0, .transpose_label_14
	beqz $t0, .transpose_label_exit
.transpose_label_13:
# %op15 = phi i32 [ %op11, %label_11 ], [ %op31, %label_17 ]
# br label %label_9
	ld.w $a0, $fp, -68
	st.w $a0, $fp, -50
	b .transpose_label_9
.transpose_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b transposeEnd__Label
.transpose_label_14:
# %op16 = getelementptr i32, i32* %arg1, i32 %op13
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -63
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -76
# %op17 = load i32, i32* %op16
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -80
# %op19 = add i32 %op18, %op8
	ld.w $t0, $fp, -139
	ld.w $t1, $fp, -50
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# %op20 = icmp sge i32 %op19, 0
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -85
# br i1 %op20, label %label_15, label %label_exit
	ld.b $t0, $fp, -85
	bnez $t0, .transpose_label_15
	beqz $t0, .transpose_label_exit
.transpose_label_15:
# %op21 = getelementptr i32, i32* %arg1, i32 %op19
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -84
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -93
# %op22 = load i32, i32* %op21
	ld.d $t0, $fp, -93
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -97
# %op23 = mul i32 %op8, %op3
	ld.w $t0, $fp, -50
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -101
# %op24 = add i32 %op23, %op4
	ld.w $t0, $fp, -101
	ld.w $t1, $fp, -40
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -105
# %op25 = icmp sge i32 %op24, 0
	ld.w $t0, $fp, -105
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -106
# br i1 %op25, label %label_16, label %label_exit
	ld.b $t0, $fp, -106
	bnez $t0, .transpose_label_16
	beqz $t0, .transpose_label_exit
.transpose_label_16:
# %op26 = getelementptr i32, i32* %arg1, i32 %op24
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -105
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -114
# store i32 %op22, i32* %op26
	ld.d $t0, $fp, -114
	ld.w $t1, $fp, -97
	st.w $t1, $t0, 0
# %op28 = add i32 %op27, %op8
	ld.w $t0, $fp, -143
	ld.w $t1, $fp, -50
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# %op29 = icmp sge i32 %op28, 0
	ld.w $t0, $fp, -118
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -119
# br i1 %op29, label %label_17, label %label_exit
	ld.b $t0, $fp, -119
	bnez $t0, .transpose_label_17
	beqz $t0, .transpose_label_exit
.transpose_label_17:
# %op30 = getelementptr i32, i32* %arg1, i32 %op28
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -118
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -127
# store i32 %op17, i32* %op30
	ld.d $t0, $fp, -127
	ld.w $t1, $fp, -80
	st.w $t1, $t0, 0
# %op31 = add i32 %op8, 1
	ld.w $t0, $fp, -50
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -131
# br label %label_13
	ld.w $a0, $fp, -131
	st.w $a0, $fp, -68
	b .transpose_label_13
.transpose_label32:
# %op12 = mul i32 %op4, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -135
# %op18 = mul i32 %op4, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -139
# %op27 = mul i32 %op4, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -143
# br label %label_9
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -50
	b .transpose_label_9
transposeEnd__Label:
	addi.d $sp, $sp, 144
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
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# %op1 = call i32 @input()
	bl input
	st.w $a0, $fp, -24
# store i32 %op1, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# br label %label_19
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -29
	b .main_label_19
.main_label_18:
# %op2 = icmp sge i32 %op3, 0
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -25
# br i1 %op2, label %label_21, label %label_exit
	ld.b $t0, $fp, -25
	bnez $t0, .main_label_21
	beqz $t0, .main_label_exit
.main_label_19:
# %op3 = phi i32 [ 0, %label_entry ], [ %op6, %label_21 ]
# %op4 = icmp slt i32 %op3, %op0
	ld.w $t0, $fp, -29
	ld.w $t1, $fp, -20
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -30
# br i1 %op4, label %label_18, label %label_20
	ld.b $t0, $fp, -30
	bnez $t0, .main_label_18
	beqz $t0, .main_label_20
.main_label_20:
# br label %label30
	b .main_label30
.main_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_21:
# %op5 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op3
	la.local $t0, matrix
	ld.w $t1, $fp, -29
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -38
# store i32 %op3, i32* %op5
	ld.d $t0, $fp, -38
	ld.w $t1, $fp, -29
	st.w $t1, $t0, 0
# %op6 = add i32 %op3, 1
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label_19
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -29
	b .main_label_19
.main_label_22:
# %op8 = icmp sge i32 %op9, 0
	ld.w $t0, $fp, -47
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -43
# br i1 %op8, label %label_25, label %label_exit
	ld.b $t0, $fp, -43
	bnez $t0, .main_label_25
	beqz $t0, .main_label_exit
.main_label_23:
# %op9 = phi i32 [ 0, %label30 ], [ %op15, %label_25 ]
# %op10 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -51
# %op11 = icmp slt i32 %op9, %op10
	ld.w $t0, $fp, -47
	ld.w $t1, $fp, -51
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -52
# br i1 %op11, label %label_22, label %label_24
	ld.b $t0, $fp, -52
	bnez $t0, .main_label_22
	beqz $t0, .main_label_24
.main_label_24:
# br label %label_27
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -81
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -85
	b .main_label_27
.main_label_25:
# %op12 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op9
	la.local $t0, ad
	ld.w $t1, $fp, -47
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -60
# %op13 = load i32, i32* %op12
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op14 = call i32 @transpose(i32 %op0, i32* %op7, i32 %op13)
	ld.w $a0, $fp, -20
	ld.d $a1, $fp, -131
	ld.w $a2, $fp, -64
	bl transpose
	st.w $a0, $fp, -68
# %op15 = add i32 %op9, 1
	ld.w $t0, $fp, -47
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# br label %label_23
	ld.w $a0, $fp, -72
	st.w $a0, $fp, -47
	b .main_label_23
.main_label_26:
# %op16 = mul i32 %op19, %op19
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -85
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op17 = icmp sge i32 %op19, 0
	ld.w $t0, $fp, -85
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -77
# br i1 %op17, label %label_29, label %label_exit
	ld.b $t0, $fp, -77
	bnez $t0, .main_label_29
	beqz $t0, .main_label_exit
.main_label_27:
# %op18 = phi i32 [ 0, %label_24 ], [ %op26, %label_29 ]
# %op19 = phi i32 [ 0, %label_24 ], [ %op27, %label_29 ]
# %op20 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -89
# %op21 = icmp slt i32 %op19, %op20
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -89
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -90
# br i1 %op21, label %label_26, label %label_28
	ld.b $t0, $fp, -90
	bnez $t0, .main_label_26
	beqz $t0, .main_label_28
.main_label_28:
# %op22 = icmp slt i32 %op18, 0
	ld.w $t0, $fp, -81
	addi.w $t1, $zero, 0
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -91
# br i1 %op22, label %label_30, label %label_31
	ld.w $a0, $fp, -81
	st.w $a0, $fp, -123
	ld.b $t0, $fp, -91
	bnez $t0, .main_label_30
	beqz $t0, .main_label_31
.main_label_29:
# %op23 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op19
	la.local $t0, matrix
	ld.w $t1, $fp, -85
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -99
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -99
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -103
# %op25 = mul i32 %op16, %op24
	ld.w $t0, $fp, -76
	ld.w $t1, $fp, -103
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op26 = add i32 %op18, %op25
	ld.w $t0, $fp, -81
	ld.w $t1, $fp, -107
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -111
# %op27 = add i32 %op19, 1
	ld.w $t0, $fp, -85
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -115
# br label %label_27
	ld.w $a0, $fp, -111
	st.w $a0, $fp, -81
	ld.w $a0, $fp, -115
	st.w $a0, $fp, -85
	b .main_label_27
.main_label_30:
# %op28 = sub i32 0, %op18
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -81
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -119
# br label %label_31
	ld.w $a0, $fp, -119
	st.w $a0, $fp, -123
	b .main_label_31
.main_label_31:
# %op29 = phi i32 [ %op18, %label_28 ], [ %op28, %label_30 ]
# call void @output(i32 %op29)
	ld.w $a0, $fp, -123
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label30:
# %op7 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -131
# br label %label_23
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -47
	b .main_label_23
mainEnd__Label:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
