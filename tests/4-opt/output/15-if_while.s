	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.main_label_entry:
# br label %label_2
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -25
	addi.w $a0, $zero, 10
	st.w $a0, $fp, -29
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -33
	b .main_label_2
.main_label_1:
# %op0 = sub i32 %op3, 1
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# %op1 = icmp slt i32 %op0, 5
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 5
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -21
# br i1 %op1, label %label_4, label %label_5
	ld.b $t0, $fp, -21
	bnez $t0, .main_label_4
	beqz $t0, .main_label_5
.main_label_2:
# %op2 = phi i32 [ 0, %label_entry ], [ %op9, %label_6 ]
# %op3 = phi i32 [ 10, %label_entry ], [ %op0, %label_6 ]
# %op4 = phi i32 [ 0, %label_entry ], [ %op10, %label_6 ]
# %op5 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -34
# br i1 %op5, label %label_1, label %label_3
	ld.b $t0, $fp, -34
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# %op6 = add i32 %op2, %op4
	ld.w $t0, $fp, -25
	ld.w $t1, $fp, -33
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -38
# ret i32 %op6
	ld.w $a0, $fp, -38
	b mainEnd__Label
.main_label_4:
# %op7 = add i32 %op2, %op0
	ld.w $t0, $fp, -25
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label_6
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -50
	ld.w $a0, $fp, -33
	st.w $a0, $fp, -54
	b .main_label_6
.main_label_5:
# %op8 = add i32 %op4, %op0
	ld.w $t0, $fp, -33
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -46
# br label %label_6
	ld.w $a0, $fp, -25
	st.w $a0, $fp, -50
	ld.w $a0, $fp, -46
	st.w $a0, $fp, -54
	b .main_label_6
.main_label_6:
# %op9 = phi i32 [ %op7, %label_4 ], [ %op2, %label_5 ]
# %op10 = phi i32 [ %op4, %label_4 ], [ %op8, %label_5 ]
# br label %label_2
	ld.w $a0, $fp, -50
	st.w $a0, $fp, -25
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -54
	st.w $a0, $fp, -33
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
