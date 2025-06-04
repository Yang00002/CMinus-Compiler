	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# br label %label_2
	b .main_label_2
.main_label_1:
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -44
# %op3 = sub i32 %op2, 1
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -48
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# store i32 %op4, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -52
	st.w $t1, $t0, 0
# br label %label_5
	b .main_label_5
.main_label_2:
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op6 = icmp ne i32 %op5, 0
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
# br i1 %op6, label %label_1, label %label_3
	ld.b $t0, $fp, -57
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# %op9 = add i32 %op7, %op8
	ld.w $t0, $fp, -61
	ld.w $t1, $fp, -65
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -69
# ret i32 %op9
	ld.w $a0, $fp, -69
	b mainEnd__Label
.main_label_4:
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# %op11 = sub i32 %op10, 1
	ld.w $t0, $fp, -73
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# store i32 %op11, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -77
	st.w $t1, $t0, 0
# br label %label_5
	b .main_label_5
.main_label_5:
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -81
# %op13 = icmp ne i32 %op12, 0
	ld.w $t0, $fp, -81
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -82
# br i1 %op13, label %label_4, label %label_6
	ld.b $t0, $fp, -82
	bnez $t0, .main_label_4
	beqz $t0, .main_label_6
.main_label_6:
# br label %label_2
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
