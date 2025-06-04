	.text
	.globl factorial
	.type factorial, @function
factorial:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.factorial_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -21
# br i1 %op1, label %label_1, label %label_2
	ld.b $t0, $fp, -21
	bnez $t0, .factorial_label_1
	beqz $t0, .factorial_label_2
.factorial_label_1:
# ret i32 1
	addi.w $a0, $zero, 1
	b factorialEnd__Label
.factorial_label_2:
# %op2 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -25
# %op3 = call i32 @factorial(i32 %op2)
	ld.w $a0, $fp, -25
	bl factorial
	st.w $a0, $fp, -29
# %op4 = mul i32 %arg0, %op3
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -29
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# ret i32 %op4
	ld.w $a0, $fp, -33
	b factorialEnd__Label
factorialEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = call i32 @factorial(i32 10)
	addi.w $a0, $zero, 10
	bl factorial
	st.w $a0, $fp, -20
# ret i32 %op0
	ld.w $a0, $fp, -20
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
