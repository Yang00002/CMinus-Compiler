	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
.main_label_entry:
# br label %label_2
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -24
	b .main_label_2
.main_label_1:
# br label %label_5
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -29
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -33
	b .main_label_5
.main_label_2:
# %op0 = phi i32 [ %op3, %label_6 ], [ undef, %label_entry ]
# %op1 = phi i32 [ 0, %label_entry ], [ %op6, %label_6 ]
# %op2 = icmp slt i32 %op1, 1000000
	ld.w $t0, $fp, -24
	lu12i.w $t1, 244
	ori $t1, $t1, 576
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -25
# br i1 %op2, label %label_1, label %label_3
	ld.b $t0, $fp, -25
	bnez $t0, .main_label_1
	beqz $t0, .main_label_3
.main_label_3:
# call void @output(i32 %op0)
	ld.w $a0, $fp, -20
	bl output
# ret void
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_4:
# br label %label_8
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -42
	ld.w $a0, $fp, -33
	st.w $a0, $fp, -46
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -50
	b .main_label_8
.main_label_5:
# %op3 = phi i32 [ %op0, %label_1 ], [ %op7, %label_9 ]
# %op4 = phi i32 [ 0, %label_1 ], [ %op11, %label_9 ]
# %op5 = icmp slt i32 %op4, 2
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -34
# br i1 %op5, label %label_4, label %label_6
	ld.b $t0, $fp, -34
	bnez $t0, .main_label_4
	beqz $t0, .main_label_6
.main_label_6:
# %op6 = add i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -38
# br label %label_2
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -38
	st.w $a0, $fp, -24
	b .main_label_2
.main_label_7:
# br label %label_11
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -59
	ld.w $a0, $fp, -46
	st.w $a0, $fp, -63
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -67
	b .main_label_11
.main_label_8:
# %op7 = phi i32 [ %op3, %label_4 ], [ %op12, %label_12 ]
# %op8 = phi i32 [ %op4, %label_4 ], [ %op13, %label_12 ]
# %op9 = phi i32 [ 0, %label_4 ], [ %op16, %label_12 ]
# %op10 = icmp slt i32 %op9, 2
	ld.w $t0, $fp, -50
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -51
# br i1 %op10, label %label_7, label %label_9
	ld.b $t0, $fp, -51
	bnez $t0, .main_label_7
	beqz $t0, .main_label_9
.main_label_9:
# %op11 = add i32 %op8, 1
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -55
# br label %label_5
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -55
	st.w $a0, $fp, -33
	b .main_label_5
.main_label_10:
# br label %label_14
	ld.w $a0, $fp, -59
	st.w $a0, $fp, -76
	ld.w $a0, $fp, -63
	st.w $a0, $fp, -80
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -84
	b .main_label_14
.main_label_11:
# %op12 = phi i32 [ %op7, %label_7 ], [ %op17, %label_15 ]
# %op13 = phi i32 [ %op8, %label_7 ], [ %op18, %label_15 ]
# %op14 = phi i32 [ 0, %label_7 ], [ %op21, %label_15 ]
# %op15 = icmp slt i32 %op14, 2
	ld.w $t0, $fp, -67
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -68
# br i1 %op15, label %label_10, label %label_12
	ld.b $t0, $fp, -68
	bnez $t0, .main_label_10
	beqz $t0, .main_label_12
.main_label_12:
# %op16 = add i32 %op9, 1
	ld.w $t0, $fp, -50
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# br label %label_8
	ld.w $a0, $fp, -59
	st.w $a0, $fp, -42
	ld.w $a0, $fp, -63
	st.w $a0, $fp, -46
	ld.w $a0, $fp, -72
	st.w $a0, $fp, -50
	b .main_label_8
.main_label_13:
# br label %label_17
	ld.w $a0, $fp, -76
	st.w $a0, $fp, -94
	ld.w $a0, $fp, -80
	st.w $a0, $fp, -98
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -102
	b .main_label_17
.main_label_14:
# %op17 = phi i32 [ %op12, %label_10 ], [ %op23, %label_18 ]
# %op18 = phi i32 [ %op13, %label_10 ], [ %op24, %label_18 ]
# %op19 = phi i32 [ 0, %label_10 ], [ %op27, %label_18 ]
# %op20 = icmp slt i32 %op19, 2
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -85
# br i1 %op20, label %label_13, label %label_15
	ld.b $t0, $fp, -85
	bnez $t0, .main_label_13
	beqz $t0, .main_label_15
.main_label_15:
# %op21 = add i32 %op14, 1
	ld.w $t0, $fp, -67
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# br label %label_11
	ld.w $a0, $fp, -76
	st.w $a0, $fp, -59
	ld.w $a0, $fp, -80
	st.w $a0, $fp, -63
	ld.w $a0, $fp, -89
	st.w $a0, $fp, -67
	b .main_label_11
.main_label_16:
# %op22 = icmp sgt i32 2, 1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -90
# br i1 %op22, label %label_19, label %label_20
	ld.w $a0, $fp, -98
	st.w $a0, $fp, -115
	ld.b $t0, $fp, -90
	bnez $t0, .main_label_19
	beqz $t0, .main_label_20
.main_label_17:
# %op23 = phi i32 [ %op17, %label_13 ], [ %op48, %label_20 ]
# %op24 = phi i32 [ %op18, %label_13 ], [ %op29, %label_20 ]
# %op25 = phi i32 [ 0, %label_13 ], [ %op49, %label_20 ]
# %op26 = icmp slt i32 %op25, 2
	ld.w $t0, $fp, -102
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -103
# br i1 %op26, label %label_16, label %label_18
	ld.b $t0, $fp, -103
	bnez $t0, .main_label_16
	beqz $t0, .main_label_18
.main_label_18:
# %op27 = add i32 %op19, 1
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# br label %label_14
	ld.w $a0, $fp, -94
	st.w $a0, $fp, -76
	ld.w $a0, $fp, -98
	st.w $a0, $fp, -80
	ld.w $a0, $fp, -107
	st.w $a0, $fp, -84
	b .main_label_14
.main_label_19:
# %op28 = add i32 %op24, 1
	ld.w $t0, $fp, -98
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -111
# br label %label_20
	ld.w $a0, $fp, -111
	st.w $a0, $fp, -115
	b .main_label_20
.main_label_20:
# %op29 = phi i32 [ %op24, %label_16 ], [ %op28, %label_19 ]
# %op30 = mul i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -119
# %op31 = mul i32 %op30, 2
	ld.w $t0, $fp, -119
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -123
# %op32 = mul i32 %op31, 2
	ld.w $t0, $fp, -123
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -127
# %op33 = mul i32 %op32, 2
	ld.w $t0, $fp, -127
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -131
# %op34 = mul i32 %op33, 2
	ld.w $t0, $fp, -131
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -135
# %op35 = mul i32 %op34, 2
	ld.w $t0, $fp, -135
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -139
# %op36 = mul i32 %op35, 2
	ld.w $t0, $fp, -139
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -143
# %op37 = mul i32 %op36, 2
	ld.w $t0, $fp, -143
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -147
# %op38 = mul i32 %op37, 2
	ld.w $t0, $fp, -147
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -151
# %op39 = sdiv i32 %op38, 2
	ld.w $t0, $fp, -151
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -155
# %op40 = sdiv i32 %op39, 2
	ld.w $t0, $fp, -155
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -159
# %op41 = sdiv i32 %op40, 2
	ld.w $t0, $fp, -159
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -163
# %op42 = sdiv i32 %op41, 2
	ld.w $t0, $fp, -163
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -167
# %op43 = sdiv i32 %op42, 2
	ld.w $t0, $fp, -167
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -171
# %op44 = sdiv i32 %op43, 2
	ld.w $t0, $fp, -171
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -175
# %op45 = sdiv i32 %op44, 2
	ld.w $t0, $fp, -175
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -179
# %op46 = sdiv i32 %op45, 2
	ld.w $t0, $fp, -179
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -183
# %op47 = sdiv i32 %op46, 2
	ld.w $t0, $fp, -183
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -187
# %op48 = sdiv i32 %op47, 2
	ld.w $t0, $fp, -187
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -191
# %op49 = add i32 %op25, 1
	ld.w $t0, $fp, -102
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -195
# br label %label_17
	ld.w $a0, $fp, -191
	st.w $a0, $fp, -94
	ld.w $a0, $fp, -115
	st.w $a0, $fp, -98
	ld.w $a0, $fp, -195
	st.w $a0, $fp, -102
	b .main_label_17
mainEnd__Label:
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
