	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# br label %label30
	b .main_label30
.main_label_1:
# %op26 = add i32 %op27, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# br label %label_2
	ld.w $a0, $fp, -24
	st.w $a0, $fp, -28
	ld.w $a0, $fp, -133
	st.w $a0, $fp, -32
	b .main_label_2
.main_label_2:
# %op27 = phi i32 [ 0, %label30 ], [ %op26, %label_1 ]
# %op28 = phi i32 [ 0, %label30 ], [ %op25, %label_1 ]
# %op29 = icmp slt i32 %op27, %op0
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -20
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -33
# br i1 %op29, label %label_1, label %label_3
	ld.b $t0, $fp, -33
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# call void @output(i32 %op28)
	ld.w $a0, $fp, -32
	bl output
# ret void
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label30:
# %op1 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -37
# %op2 = fmul float %op1, 0x4002aa9940000000
	fld.s $ft0, $fp, -37
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -41
# %op3 = fmul float %op2, 0x4011781d80000000
	fld.s $ft0, $fp, -41
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -45
# %op4 = fmul float %op3, 0x401962ac40000000
	fld.s $ft0, $fp, -45
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -49
# %op5 = fptosi float %op4 to i32
	fld.s $ft0, $fp, -49
	ftintrz.w.s $ft0, $ft0
	movfr2gr.s $t0, $ft0
	st.w $t0, $fp, -53
# %op6 = mul i32 %op5, %op5
	ld.w $t0, $fp, -53
	ld.w $t1, $fp, -53
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -57
# %op7 = mul i32 %op6, %op5
	ld.w $t0, $fp, -57
	ld.w $t1, $fp, -53
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op8 = mul i32 %op7, %op5
	ld.w $t0, $fp, -61
	ld.w $t1, $fp, -53
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -65
# %op9 = mul i32 %op8, %op5
	ld.w $t0, $fp, -65
	ld.w $t1, $fp, -53
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -69
# %op10 = mul i32 %op9, %op5
	ld.w $t0, $fp, -69
	ld.w $t1, $fp, -53
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# %op11 = mul i32 %op10, %op10
	ld.w $t0, $fp, -73
	ld.w $t1, $fp, -73
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op12 = mul i32 %op11, %op10
	ld.w $t0, $fp, -77
	ld.w $t1, $fp, -73
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# %op13 = mul i32 %op12, %op10
	ld.w $t0, $fp, -81
	ld.w $t1, $fp, -73
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op14 = mul i32 %op13, %op10
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -73
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op15 = mul i32 %op14, %op10
	ld.w $t0, $fp, -89
	ld.w $t1, $fp, -73
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -93
# %op16 = mul i32 %op15, %op15
	ld.w $t0, $fp, -93
	ld.w $t1, $fp, -93
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op17 = mul i32 %op16, %op15
	ld.w $t0, $fp, -97
	ld.w $t1, $fp, -93
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -101
# %op18 = mul i32 %op17, %op15
	ld.w $t0, $fp, -101
	ld.w $t1, $fp, -93
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -105
# %op19 = mul i32 %op18, %op15
	ld.w $t0, $fp, -105
	ld.w $t1, $fp, -93
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -109
# %op20 = mul i32 %op19, %op15
	ld.w $t0, $fp, -109
	ld.w $t1, $fp, -93
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -113
# %op21 = mul i32 %op20, %op20
	ld.w $t0, $fp, -113
	ld.w $t1, $fp, -113
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -117
# %op22 = mul i32 %op21, %op20
	ld.w $t0, $fp, -117
	ld.w $t1, $fp, -113
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -121
# %op23 = mul i32 %op22, %op20
	ld.w $t0, $fp, -121
	ld.w $t1, $fp, -113
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -125
# %op24 = mul i32 %op23, %op20
	ld.w $t0, $fp, -125
	ld.w $t1, $fp, -113
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# %op25 = mul i32 %op24, %op20
	ld.w $t0, $fp, -129
	ld.w $t1, $fp, -113
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -133
# br label %label_2
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -32
	b .main_label_2
mainEnd__Label:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
