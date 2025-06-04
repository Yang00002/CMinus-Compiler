	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
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
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# br label %label_2
	b .main_label_2
.main_label_1:
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op4 = sub i32 %op3, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# store i32 %op4, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op6 = icmp slt i32 %op5, 5
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 5
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -65
# br i1 %op6, label %label_4, label %label_5
	ld.b $t0, $fp, -65
	bnez $t0, .main_label_4
	beqz $t0, .main_label_5
.main_label_2:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -69
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -70
# br i1 %op8, label %label_1, label %label_3
	ld.b $t0, $fp, -70
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -74
# %op10 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -78
# %op11 = add i32 %op9, %op10
	ld.w $t0, $fp, -74
	ld.w $t1, $fp, -78
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -82
# ret i32 %op11
	ld.w $a0, $fp, -82
	b mainEnd__Label
.main_label_4:
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -86
# %op13 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -90
# %op14 = add i32 %op12, %op13
	ld.w $t0, $fp, -86
	ld.w $t1, $fp, -90
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -94
# store i32 %op14, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -94
	st.w $t1, $t0, 0
# br label %label_6
	b .main_label_6
.main_label_5:
# %op15 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -98
# %op16 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -102
# %op17 = add i32 %op15, %op16
	ld.w $t0, $fp, -98
	ld.w $t1, $fp, -102
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -106
# store i32 %op17, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -106
	st.w $t1, $t0, 0
# br label %label_6
	b .main_label_6
.main_label_6:
# br label %label_2
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
