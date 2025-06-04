	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -336
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
# %op3 = alloca i32
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -60
# %op4 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op5 = alloca i32
	addi.d $t0, $fp, -88
	st.d $t0, $fp, -84
# %op6 = alloca i32
	addi.d $t0, $fp, -100
	st.d $t0, $fp, -96
# %op7 = call i32 @input()
	bl input
	st.w $a0, $fp, -104
# store i32 %op7, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -104
	st.w $t1, $t0, 0
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op5
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_2
	b .main_label_2
.main_label_1:
# %op8 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -108
# %op9 = fmul float %op8, 0x4002aa9940000000
	fld.s $ft0, $fp, -108
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -112
# %op10 = fmul float %op9, 0x4011781d80000000
	fld.s $ft0, $fp, -112
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -116
# %op11 = fmul float %op10, 0x401962ac40000000
	fld.s $ft0, $fp, -116
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -120
# %op12 = fptosi float %op11 to i32
	fld.s $ft0, $fp, -120
	ftintrz.w.s $ft0, $ft0
	movfr2gr.s $t0, $ft0
	st.w $t0, $fp, -124
# store i32 %op12, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -124
	st.w $t1, $t0, 0
# %op13 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -128
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -132
# %op15 = mul i32 %op13, %op14
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -132
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op16 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -140
# %op17 = mul i32 %op15, %op16
	ld.w $t0, $fp, -136
	ld.w $t1, $fp, -140
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -148
# %op19 = mul i32 %op17, %op18
	ld.w $t0, $fp, -144
	ld.w $t1, $fp, -148
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op20 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -156
# %op21 = mul i32 %op19, %op20
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op22 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -164
# %op23 = mul i32 %op21, %op22
	ld.w $t0, $fp, -160
	ld.w $t1, $fp, -164
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -168
# store i32 %op23, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -168
	st.w $t1, $t0, 0
# %op24 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -172
# %op25 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -176
# %op26 = mul i32 %op24, %op25
	ld.w $t0, $fp, -172
	ld.w $t1, $fp, -176
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op27 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -184
# %op28 = mul i32 %op26, %op27
	ld.w $t0, $fp, -180
	ld.w $t1, $fp, -184
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -188
# %op29 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -192
# %op30 = mul i32 %op28, %op29
	ld.w $t0, $fp, -188
	ld.w $t1, $fp, -192
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op31 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -200
# %op32 = mul i32 %op30, %op31
	ld.w $t0, $fp, -196
	ld.w $t1, $fp, -200
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op33 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -208
# %op34 = mul i32 %op32, %op33
	ld.w $t0, $fp, -204
	ld.w $t1, $fp, -208
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# store i32 %op34, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $fp, -212
	st.w $t1, $t0, 0
# %op35 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -216
# %op36 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -220
# %op37 = mul i32 %op35, %op36
	ld.w $t0, $fp, -216
	ld.w $t1, $fp, -220
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op38 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -228
# %op39 = mul i32 %op37, %op38
	ld.w $t0, $fp, -224
	ld.w $t1, $fp, -228
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# %op40 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -236
# %op41 = mul i32 %op39, %op40
	ld.w $t0, $fp, -232
	ld.w $t1, $fp, -236
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -240
# %op42 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -244
# %op43 = mul i32 %op41, %op42
	ld.w $t0, $fp, -240
	ld.w $t1, $fp, -244
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -248
# %op44 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -252
# %op45 = mul i32 %op43, %op44
	ld.w $t0, $fp, -248
	ld.w $t1, $fp, -252
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -256
# store i32 %op45, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -256
	st.w $t1, $t0, 0
# %op46 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -260
# %op47 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -264
# %op48 = mul i32 %op46, %op47
	ld.w $t0, $fp, -260
	ld.w $t1, $fp, -264
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -268
# %op49 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -272
# %op50 = mul i32 %op48, %op49
	ld.w $t0, $fp, -268
	ld.w $t1, $fp, -272
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -276
# %op51 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -280
# %op52 = mul i32 %op50, %op51
	ld.w $t0, $fp, -276
	ld.w $t1, $fp, -280
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -284
# %op53 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -288
# %op54 = mul i32 %op52, %op53
	ld.w $t0, $fp, -284
	ld.w $t1, $fp, -288
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -292
# %op55 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -296
# %op56 = mul i32 %op54, %op55
	ld.w $t0, $fp, -292
	ld.w $t1, $fp, -296
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -300
# store i32 %op56, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -300
	st.w $t1, $t0, 0
# %op57 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -304
# %op58 = add i32 %op57, 1
	ld.w $t0, $fp, -304
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -308
# store i32 %op58, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -308
	st.w $t1, $t0, 0
# br label %label_2
	b .main_label_2
.main_label_2:
# %op59 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -312
# %op60 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -316
# %op61 = icmp slt i32 %op59, %op60
	ld.w $t0, $fp, -312
	ld.w $t1, $fp, -316
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -317
# br i1 %op61, label %label_1, label %label_3
	ld.b $t0, $fp, -317
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# %op62 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -321
# call void @output(i32 %op62)
	ld.w $a0, $fp, -321
	bl output
# ret void
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 336
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
