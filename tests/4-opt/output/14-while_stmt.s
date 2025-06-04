	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# br label %label_2
	addi.w $a0, $zero, 10
	st.w $a0, $fp, -24
	b .main_label_2
.main_label_1:
# %op0 = sub i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# br label %label_2
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -24
	b .main_label_2
.main_label_2:
# %op1 = phi i32 [ 10, %label_entry ], [ %op0, %label_1 ]
# %op2 = icmp ne i32 %op1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -25
# br i1 %op2, label %label_1, label %label_3
	ld.b $t0, $fp, -25
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# ret void
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
