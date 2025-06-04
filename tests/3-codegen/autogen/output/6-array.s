	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -84
# store i32 11, i32* %op2
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -92
# store i32 22, i32* %op3
	ld.d $t0, $fp, -92
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 9
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -100
# store i32 33, i32* %op4
	ld.d $t0, $fp, -100
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -108
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -108
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -112
# call void @output(i32 %op6)
	ld.w $a0, $fp, -112
	bl output
# %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -120
# %op8 = load i32, i32* %op7
	ld.d $t0, $fp, -120
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -124
# call void @output(i32 %op8)
	ld.w $a0, $fp, -124
	bl output
# %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 9
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -132
# %op10 = load i32, i32* %op9
	ld.d $t0, $fp, -132
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -136
# call void @output(i32 %op10)
	ld.w $a0, $fp, -136
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
