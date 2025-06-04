	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 1, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
# br label %label_2
	b .main_label_2
.main_label_1:
# %op1 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -32
# %op2 = add i32 %op1, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# store i32 %op2, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -36
	st.w $t1, $t0, 0
# br label %label_2
	b .main_label_2
.main_label_2:
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -40
# %op4 = icmp slt i32 %op3, 999999999
	ld.w $t0, $fp, -40
	lu12i.w $t1, 244140
	ori $t1, $t1, 2559
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -41
# br i1 %op4, label %label_1, label %label_3
	ld.b $t0, $fp, -41
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -45
# ret i32 %op5
	ld.w $a0, $fp, -45
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
