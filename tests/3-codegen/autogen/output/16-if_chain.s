	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# %op2 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 2, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# store i32 1, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -57
# br i1 %op4, label %label_1, label %label_2
	ld.b $t0, $fp, -57
	bnez $t0, .main_label_1
	beqz $t0, .main_label_2
.main_label_1:
# %op5 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# %op6 = icmp ne i32 %op5, 0
	ld.w $t0, $fp, -61
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -62
# br i1 %op6, label %label_3, label %label_4
	ld.b $t0, $fp, -62
	bnez $t0, .main_label_3
	beqz $t0, .main_label_4
.main_label_2:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -66
# ret i32 %op7
	ld.w $a0, $fp, -66
	b mainEnd__Label
.main_label_3:
# store i32 4, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# br label %label_5
	b .main_label_5
.main_label_4:
# store i32 3, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# br label %label_5
	b .main_label_5
.main_label_5:
# br label %label_2
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
