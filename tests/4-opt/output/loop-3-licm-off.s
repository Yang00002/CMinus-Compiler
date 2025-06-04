	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
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
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -46
	b .main_label_8
.main_label_5:
# %op3 = phi i32 [ %op0, %label_1 ], [ %op7, %label_9 ]
# %op4 = phi i32 [ 0, %label_1 ], [ %op10, %label_9 ]
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
	st.w $a0, $fp, -55
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -59
	b .main_label_11
.main_label_8:
# %op7 = phi i32 [ %op3, %label_4 ], [ %op11, %label_12 ]
# %op8 = phi i32 [ 0, %label_4 ], [ %op14, %label_12 ]
# %op9 = icmp slt i32 %op8, 2
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -47
# br i1 %op9, label %label_7, label %label_9
	ld.b $t0, $fp, -47
	bnez $t0, .main_label_7
	beqz $t0, .main_label_9
.main_label_9:
# %op10 = add i32 %op4, 1
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -51
# br label %label_5
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -51
	st.w $a0, $fp, -33
	b .main_label_5
.main_label_10:
# br label %label_14
	ld.w $a0, $fp, -55
	st.w $a0, $fp, -68
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -72
	b .main_label_14
.main_label_11:
# %op11 = phi i32 [ %op7, %label_7 ], [ %op15, %label_15 ]
# %op12 = phi i32 [ 0, %label_7 ], [ %op18, %label_15 ]
# %op13 = icmp slt i32 %op12, 2
	ld.w $t0, $fp, -59
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -60
# br i1 %op13, label %label_10, label %label_12
	ld.b $t0, $fp, -60
	bnez $t0, .main_label_10
	beqz $t0, .main_label_12
.main_label_12:
# %op14 = add i32 %op8, 1
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# br label %label_8
	ld.w $a0, $fp, -55
	st.w $a0, $fp, -42
	ld.w $a0, $fp, -64
	st.w $a0, $fp, -46
	b .main_label_8
.main_label_13:
# br label %label_17
	ld.w $a0, $fp, -68
	st.w $a0, $fp, -161
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -165
	b .main_label_17
.main_label_14:
# %op15 = phi i32 [ %op11, %label_10 ], [ %op39, %label_18 ]
# %op16 = phi i32 [ 0, %label_10 ], [ %op42, %label_18 ]
# %op17 = icmp slt i32 %op16, 2
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -73
# br i1 %op17, label %label_13, label %label_15
	ld.b $t0, $fp, -73
	bnez $t0, .main_label_13
	beqz $t0, .main_label_15
.main_label_15:
# %op18 = add i32 %op12, 1
	ld.w $t0, $fp, -59
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# br label %label_11
	ld.w $a0, $fp, -68
	st.w $a0, $fp, -55
	ld.w $a0, $fp, -77
	st.w $a0, $fp, -59
	b .main_label_11
.main_label_16:
# %op19 = mul i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# %op20 = mul i32 %op19, 2
	ld.w $t0, $fp, -81
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op21 = mul i32 %op20, 2
	ld.w $t0, $fp, -85
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op22 = mul i32 %op21, 2
	ld.w $t0, $fp, -89
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -93
# %op23 = mul i32 %op22, 2
	ld.w $t0, $fp, -93
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op24 = mul i32 %op23, 2
	ld.w $t0, $fp, -97
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -101
# %op25 = mul i32 %op24, 2
	ld.w $t0, $fp, -101
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -105
# %op26 = mul i32 %op25, 2
	ld.w $t0, $fp, -105
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -109
# %op27 = mul i32 %op26, 2
	ld.w $t0, $fp, -109
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -113
# %op28 = sdiv i32 %op27, 2
	ld.w $t0, $fp, -113
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -117
# %op29 = sdiv i32 %op28, 2
	ld.w $t0, $fp, -117
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -121
# %op30 = sdiv i32 %op29, 2
	ld.w $t0, $fp, -121
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -125
# %op31 = sdiv i32 %op30, 2
	ld.w $t0, $fp, -125
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# %op32 = sdiv i32 %op31, 2
	ld.w $t0, $fp, -129
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -133
# %op33 = sdiv i32 %op32, 2
	ld.w $t0, $fp, -133
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -137
# %op34 = sdiv i32 %op33, 2
	ld.w $t0, $fp, -137
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -141
# %op35 = sdiv i32 %op34, 2
	ld.w $t0, $fp, -141
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -145
# %op36 = sdiv i32 %op35, 2
	ld.w $t0, $fp, -145
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -149
# %op37 = sdiv i32 %op36, 2
	ld.w $t0, $fp, -149
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -153
# %op38 = add i32 %op40, 1
	ld.w $t0, $fp, -165
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -157
# br label %label_17
	ld.w $a0, $fp, -153
	st.w $a0, $fp, -161
	ld.w $a0, $fp, -157
	st.w $a0, $fp, -165
	b .main_label_17
.main_label_17:
# %op39 = phi i32 [ %op15, %label_13 ], [ %op37, %label_16 ]
# %op40 = phi i32 [ 0, %label_13 ], [ %op38, %label_16 ]
# %op41 = icmp slt i32 %op40, 2
	ld.w $t0, $fp, -165
	addi.w $t1, $zero, 2
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -166
# br i1 %op41, label %label_16, label %label_18
	ld.b $t0, $fp, -166
	bnez $t0, .main_label_16
	beqz $t0, .main_label_18
.main_label_18:
# %op42 = add i32 %op16, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -170
# br label %label_14
	ld.w $a0, $fp, -161
	st.w $a0, $fp, -68
	ld.w $a0, $fp, -170
	st.w $a0, $fp, -72
	b .main_label_14
mainEnd__Label:
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
