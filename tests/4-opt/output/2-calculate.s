	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = mul i32 25, 4
	addi.w $t0, $zero, 25
	addi.w $t1, $zero, 4
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# %op1 = add i32 23, %op0
	addi.w $t0, $zero, 23
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# ret i32 %op1
	ld.w $a0, $fp, -24
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
