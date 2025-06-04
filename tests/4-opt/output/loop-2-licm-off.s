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
	addi.w $a0, $zero, 0
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
# %op0 = phi i32 [ 0, %label_entry ], [ %op26, %label_6 ]
# %op1 = phi i32 [ %op24, %label_6 ], [ undef, %label_entry ]
# %op2 = icmp slt i32 %op0, 10000000
	ld.w $t0, $fp, -20
	lu12i.w $t1, 2441
	ori $t1, $t1, 1664
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
# %op3 = mul i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -29
# %op4 = mul i32 %op3, 2
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# %op5 = mul i32 %op4, 2
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -37
# %op6 = mul i32 %op5, 2
	ld.w $t0, $fp, -37
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -41
# %op7 = mul i32 %op6, 2
	ld.w $t0, $fp, -41
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -45
# %op8 = mul i32 %op7, 2
	ld.w $t0, $fp, -45
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -49
# %op9 = mul i32 %op8, 2
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -53
# %op10 = mul i32 %op9, 2
	ld.w $t0, $fp, -53
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -57
# %op11 = mul i32 %op10, 2
	ld.w $t0, $fp, -57
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op12 = sdiv i32 %op11, 2
	ld.w $t0, $fp, -61
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -65
# %op13 = sdiv i32 %op12, 2
	ld.w $t0, $fp, -65
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -69
# %op14 = sdiv i32 %op13, 2
	ld.w $t0, $fp, -69
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# %op15 = sdiv i32 %op14, 2
	ld.w $t0, $fp, -73
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op16 = sdiv i32 %op15, 2
	ld.w $t0, $fp, -77
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# %op17 = sdiv i32 %op16, 2
	ld.w $t0, $fp, -81
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op18 = sdiv i32 %op17, 2
	ld.w $t0, $fp, -85
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op19 = sdiv i32 %op18, 2
	ld.w $t0, $fp, -89
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -93
# %op20 = sdiv i32 %op19, 2
	ld.w $t0, $fp, -93
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op21 = sdiv i32 %op20, 2
	ld.w $t0, $fp, -97
	addi.w $t1, $zero, 2
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
# %op25 = icmp slt i32 %op23, 2
	ld.w $t0, $fp, -109
	addi.w $t1, $zero, 2
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
