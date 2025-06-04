	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label_2
	addi.w $a0, $zero, 10
	st.w $a0, $fp, -28
	b .main_label_2
.main_label_1:
# %op0 = sub i32 %op2, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# br label %label_5
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -41
	b .main_label_5
.main_label_2:
# %op1 = phi i32 [ %op6, %label_6 ], [ undef, %label_entry ]
# %op2 = phi i32 [ 10, %label_entry ], [ %op0, %label_6 ]
# %op3 = icmp ne i32 %op2, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -29
# br i1 %op3, label %label_1, label %label_3
	ld.b $t0, $fp, -29
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# %op4 = add i32 %op2, %op1
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# ret i32 %op4
	ld.w $a0, $fp, -33
	b mainEnd__Label
.main_label_4:
# %op5 = sub i32 %op6, 1
	ld.w $t0, $fp, -41
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -37
# br label %label_5
	ld.w $a0, $fp, -37
	st.w $a0, $fp, -41
	b .main_label_5
.main_label_5:
# %op6 = phi i32 [ %op0, %label_1 ], [ %op5, %label_4 ]
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -41
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -42
# br i1 %op7, label %label_4, label %label_6
	ld.b $t0, $fp, -42
	bnez $t0, .main_label_4
	beqz $t0, .main_label_6
.main_label_6:
# br label %label_2
	ld.w $a0, $fp, -41
	st.w $a0, $fp, -24
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -28
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
