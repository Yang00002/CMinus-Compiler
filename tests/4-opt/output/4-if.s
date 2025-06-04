	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp sgt i32 11, 22
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 22
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -17
# br i1 %op0, label %label_1, label %label_2
	ld.b $t0, $fp, -17
	bnez $t0, .main_label_1
	beqz $t0, .main_label_2
.main_label_1:
# %op1 = icmp sgt i32 11, 33
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 33
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -18
# br i1 %op1, label %label_4, label %label_5
	ld.b $t0, $fp, -18
	bnez $t0, .main_label_4
	beqz $t0, .main_label_5
.main_label_2:
# %op2 = icmp slt i32 33, 22
	addi.w $t0, $zero, 33
	addi.w $t1, $zero, 22
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -19
# br i1 %op2, label %label_7, label %label_8
	ld.b $t0, $fp, -19
	bnez $t0, .main_label_7
	beqz $t0, .main_label_8
.main_label_3:
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_4:
# call void @output(i32 11)
	addi.w $a0, $zero, 11
	bl output
# br label %label_6
	b .main_label_6
.main_label_5:
# call void @output(i32 33)
	addi.w $a0, $zero, 33
	bl output
# br label %label_6
	b .main_label_6
.main_label_6:
# br label %label_3
	b .main_label_3
.main_label_7:
# call void @output(i32 22)
	addi.w $a0, $zero, 22
	bl output
# br label %label_9
	b .main_label_9
.main_label_8:
# call void @output(i32 33)
	addi.w $a0, $zero, 33
	bl output
# br label %label_9
	b .main_label_9
.main_label_9:
# br label %label_3
	b .main_label_3
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
