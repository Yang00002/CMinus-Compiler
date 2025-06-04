	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
.main_label_entry:
# br label %label_2
	addi.w $a0, $zero, 1
	st.w $a0, $fp, -20
	b .main_label_2
.main_label_1:
# br label %label_5
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -109
	ld.w $a0, $fp, -24
	st.w $a0, $fp, -113
	b .main_label_5
.main_label_2:
# %op0 = phi i32 [ 1, %label_entry ], [ %op26, %label_6 ]
# %op1 = phi i32 [ %op24, %label_6 ], [ undef, %label_entry ]
# %op2 = icmp slt i32 %op0, 10000
	ld.w $t0, $fp, -20
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -25
# br i1 %op2, label %label_1, label %label_3
	ld.b $t0, $fp, -25
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# call void @output(i32 %op1)
	ld.w $a0, $fp, -24
	bl output
# ret void
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_4:
# %op3 = mul i32 %op0, %op0
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -29
# %op4 = mul i32 %op3, %op0
	ld.w $t0, $fp, -29
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# %op5 = mul i32 %op4, %op0
	ld.w $t0, $fp, -33
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -37
# %op6 = mul i32 %op5, %op0
	ld.w $t0, $fp, -37
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -41
# %op7 = mul i32 %op6, %op0
	ld.w $t0, $fp, -41
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -45
# %op8 = mul i32 %op7, %op0
	ld.w $t0, $fp, -45
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -49
# %op9 = mul i32 %op8, %op0
	ld.w $t0, $fp, -49
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -53
# %op10 = mul i32 %op9, %op0
	ld.w $t0, $fp, -53
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -57
# %op11 = mul i32 %op10, %op0
	ld.w $t0, $fp, -57
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op12 = sdiv i32 %op11, %op0
	ld.w $t0, $fp, -61
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -65
# %op13 = sdiv i32 %op12, %op0
	ld.w $t0, $fp, -65
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -69
# %op14 = sdiv i32 %op13, %op0
	ld.w $t0, $fp, -69
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# %op15 = sdiv i32 %op14, %op0
	ld.w $t0, $fp, -73
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op16 = sdiv i32 %op15, %op0
	ld.w $t0, $fp, -77
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# %op17 = sdiv i32 %op16, %op0
	ld.w $t0, $fp, -81
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op18 = sdiv i32 %op17, %op0
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op19 = sdiv i32 %op18, %op0
	ld.w $t0, $fp, -89
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -93
# %op20 = sdiv i32 %op19, %op0
	ld.w $t0, $fp, -93
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op21 = sdiv i32 %op20, %op0
	ld.w $t0, $fp, -97
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -101
# %op22 = add i32 %op23, 1
	ld.w $t0, $fp, -109
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -105
# br label %label_5
	ld.w $a0, $fp, -105
	st.w $a0, $fp, -109
	ld.w $a0, $fp, -101
	st.w $a0, $fp, -113
	b .main_label_5
.main_label_5:
# %op23 = phi i32 [ 0, %label_1 ], [ %op22, %label_4 ]
# %op24 = phi i32 [ %op1, %label_1 ], [ %op21, %label_4 ]
# %op25 = icmp slt i32 %op23, 10000
	ld.w $t0, $fp, -109
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -114
# br i1 %op25, label %label_4, label %label_6
	ld.b $t0, $fp, -114
	bnez $t0, .main_label_4
	beqz $t0, .main_label_6
.main_label_6:
# %op26 = add i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# br label %label_2
	ld.w $a0, $fp, -118
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -113
	st.w $a0, $fp, -24
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
