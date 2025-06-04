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
# br label %label_2
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -128
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -132
	b .main_label_2
.main_label_1:
# %op1 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -24
# %op2 = fmul float %op1, 0x4002aa9940000000
	fld.s $ft0, $fp, -24
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -28
# %op3 = fmul float %op2, 0x4011781d80000000
	fld.s $ft0, $fp, -28
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -32
# %op4 = fmul float %op3, 0x401962ac40000000
	fld.s $ft0, $fp, -32
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -36
# %op5 = fptosi float %op4 to i32
	fld.s $ft0, $fp, -36
	ftintrz.w.s $ft0, $ft0
	movfr2gr.s $t0, $ft0
	st.w $t0, $fp, -40
# %op6 = mul i32 %op5, %op5
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op7 = mul i32 %op6, %op5
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op8 = mul i32 %op7, %op5
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op9 = mul i32 %op8, %op5
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op10 = mul i32 %op9, %op5
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op11 = mul i32 %op10, %op10
	ld.w $t0, $fp, -60
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# %op12 = mul i32 %op11, %op10
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# %op13 = mul i32 %op12, %op10
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# %op14 = mul i32 %op13, %op10
	ld.w $t0, $fp, -72
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op15 = mul i32 %op14, %op10
	ld.w $t0, $fp, -76
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op16 = mul i32 %op15, %op15
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# %op17 = mul i32 %op16, %op15
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op18 = mul i32 %op17, %op15
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op19 = mul i32 %op18, %op15
	ld.w $t0, $fp, -92
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op20 = mul i32 %op19, %op15
	ld.w $t0, $fp, -96
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op21 = mul i32 %op20, %op20
	ld.w $t0, $fp, -100
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op22 = mul i32 %op21, %op20
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op23 = mul i32 %op22, %op20
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op24 = mul i32 %op23, %op20
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op25 = mul i32 %op24, %op20
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op26 = add i32 %op27, 1
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# br label %label_2
	ld.w $a0, $fp, -124
	st.w $a0, $fp, -128
	ld.w $a0, $fp, -120
	st.w $a0, $fp, -132
	b .main_label_2
.main_label_2:
# %op27 = phi i32 [ 0, %label_entry ], [ %op26, %label_1 ]
# %op28 = phi i32 [ 0, %label_entry ], [ %op25, %label_1 ]
# %op29 = icmp slt i32 %op27, %op0
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -20
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -133
# br i1 %op29, label %label_1, label %label_3
	ld.b $t0, $fp, -133
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# call void @output(i32 %op28)
	ld.w $a0, $fp, -132
	bl output
# ret void
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
