	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -56
	st.d $t0, $fp, -52
# store i32 %arg2, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -60
# %op6 = load i32, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op7 = icmp sge i32 %op6, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -65
# br i1 %op7, label %label_1, label %label_exit
	ld.b $t0, $fp, -65
	bnez $t0, .store_label_1
	beqz $t0, .store_label_exit
.store_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b storeEnd__Label
.store_label_1:
# %op8 = getelementptr i32, i32* %arg0, i32 %op6
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -64
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -73
# store i32 %op5, i32* %op8
	ld.d $t0, $fp, -73
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
# %op9 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -77
# ret i32 %op9
	ld.w $a0, $fp, -77
	b storeEnd__Label
storeEnd__Label:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op2 = alloca i32
	addi.d $t0, $fp, -88
	st.d $t0, $fp, -84
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_3
	b .main_label_3
.main_label_2:
# %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -100
# %op5 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -104
# %op6 = mul i32 %op5, 2
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op7 = call i32 @store(i32* %op3, i32 %op4, i32 %op6)
	ld.d $a0, $fp, -96
	ld.w $a1, $fp, -100
	ld.w $a2, $fp, -108
	bl store
	st.w $a0, $fp, -112
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -116
# %op9 = add i32 %op8, 1
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# store i32 %op9, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -120
	st.w $t1, $t0, 0
# br label %label_3
	b .main_label_3
.main_label_3:
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -124
# %op11 = icmp slt i32 %op10, 10
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 10
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -125
# br i1 %op11, label %label_2, label %label_4
	ld.b $t0, $fp, -125
	bnez $t0, .main_label_2
	beqz $t0, .main_label_4
.main_label_4:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_6
	b .main_label_6
.main_label_5:
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -129
# %op13 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -133
# %op14 = icmp sge i32 %op13, 0
	ld.w $t0, $fp, -133
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -134
# br i1 %op14, label %label_8, label %label_exit
	ld.b $t0, $fp, -134
	bnez $t0, .main_label_8
	beqz $t0, .main_label_exit
.main_label_6:
# %op15 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -138
# %op16 = icmp slt i32 %op15, 10
	ld.w $t0, $fp, -138
	addi.w $t1, $zero, 10
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -139
# br i1 %op16, label %label_5, label %label_7
	ld.b $t0, $fp, -139
	bnez $t0, .main_label_5
	beqz $t0, .main_label_7
.main_label_7:
# %op17 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -143
# call void @output(i32 %op17)
	ld.w $a0, $fp, -143
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
.main_label_8:
# %op18 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op13
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -133
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -151
# %op19 = load i32, i32* %op18
	ld.d $t0, $fp, -151
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -155
# %op20 = add i32 %op12, %op19
	ld.w $t0, $fp, -129
	ld.w $t1, $fp, -155
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -159
# store i32 %op20, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -159
	st.w $t1, $t0, 0
# %op21 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -163
# %op22 = add i32 %op21, 1
	ld.w $t0, $fp, -163
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -167
# store i32 %op22, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -167
	st.w $t1, $t0, 0
# br label %label_6
	b .main_label_6
mainEnd__Label:
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
