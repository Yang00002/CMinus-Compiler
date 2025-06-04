	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp ne i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -17
# br i1 %op0, label %label_1, label %label_2
	addi.w $a0, $zero, 2
	st.w $a0, $fp, -22
	ld.b $t0, $fp, -17
	bnez $t0, .main_label_1
	beqz $t0, .main_label_2
.main_label_1:
# %op1 = icmp ne i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -18
# br i1 %op1, label %label_3, label %label_4
	ld.b $t0, $fp, -18
	bnez $t0, .main_label_3
	beqz $t0, .main_label_4
.main_label_2:
# %op2 = phi i32 [ 2, %label_entry ], [ %op3, %label_5 ]
# ret i32 %op2
	ld.w $a0, $fp, -22
	b mainEnd__Label
.main_label_3:
# br label %label_5
	addi.w $a0, $zero, 4
	st.w $a0, $fp, -26
	b .main_label_5
.main_label_4:
# br label %label_5
	addi.w $a0, $zero, 3
	st.w $a0, $fp, -26
	b .main_label_5
.main_label_5:
# %op3 = phi i32 [ 4, %label_3 ], [ 3, %label_4 ]
# br label %label_2
	ld.w $a0, $fp, -26
	st.w $a0, $fp, -22
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
