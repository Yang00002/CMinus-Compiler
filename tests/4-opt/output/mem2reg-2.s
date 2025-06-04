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
	addi.w $a0, $zero, 1
	st.w $a0, $fp, -24
	b .main_label_2
.main_label_1:
# %op0 = add i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# br label %label_2
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -24
	b .main_label_2
.main_label_2:
# %op1 = phi i32 [ 1, %label_entry ], [ %op0, %label_1 ]
# %op2 = icmp slt i32 %op1, 999999999
	ld.w $t0, $fp, -24
	lu12i.w $t1, 244140
	ori $t1, $t1, 2559
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -25
# br i1 %op2, label %label_1, label %label_3
	ld.b $t0, $fp, -25
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# ret i32 %op1
	ld.w $a0, $fp, -24
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
