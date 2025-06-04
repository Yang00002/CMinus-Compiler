	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = icmp sge i32 %arg1, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -33
# br i1 %op3, label %label_1, label %label_exit
	ld.b $t0, $fp, -33
	bnez $t0, .store_label_1
	beqz $t0, .store_label_exit
.store_label_exit:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b storeEnd__Label
.store_label_1:
# %op4 = getelementptr i32, i32* %arg0, i32 %arg1
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -28
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -41
# store i32 %arg2, i32* %op4
	ld.d $t0, $fp, -41
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# ret i32 %arg2
	ld.w $a0, $fp, -32
	b storeEnd__Label
storeEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# br label %label15
	b .main_label15
.main_label_2:
# %op2 = mul i32 %op5, 2
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# %op3 = call i32 @store(i32* %op1, i32 %op5, i32 %op2)
	ld.d $a0, $fp, -119
	ld.w $a1, $fp, -80
	ld.w $a2, $fp, -68
	bl store
	st.w $a0, $fp, -72
# %op4 = add i32 %op5, 1
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# br label %label_3
	ld.w $a0, $fp, -76
	st.w $a0, $fp, -80
	b .main_label_3
.main_label_3:
# %op5 = phi i32 [ 0, %label15 ], [ %op4, %label_2 ]
# %op6 = icmp slt i32 %op5, 10
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 10
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -81
# br i1 %op6, label %label_2, label %label_4
	ld.b $t0, $fp, -81
	bnez $t0, .main_label_2
	beqz $t0, .main_label_4
.main_label_4:
# br label %label_6
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -86
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -90
	b .main_label_6
.main_label_5:
# %op7 = icmp sge i32 %op9, 0
	ld.w $t0, $fp, -90
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -82
# br i1 %op7, label %label_8, label %label_exit
	ld.b $t0, $fp, -82
	bnez $t0, .main_label_8
	beqz $t0, .main_label_exit
.main_label_6:
# %op8 = phi i32 [ 0, %label_4 ], [ %op13, %label_8 ]
# %op9 = phi i32 [ 0, %label_4 ], [ %op14, %label_8 ]
# %op10 = icmp slt i32 %op9, 10
	ld.w $t0, $fp, -90
	addi.w $t1, $zero, 10
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -91
# br i1 %op10, label %label_5, label %label_7
	ld.b $t0, $fp, -91
	bnez $t0, .main_label_5
	beqz $t0, .main_label_7
.main_label_7:
# call void @output(i32 %op8)
	ld.w $a0, $fp, -86
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
# %op11 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op9
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -90
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -99
# %op12 = load i32, i32* %op11
	ld.d $t0, $fp, -99
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -103
# %op13 = add i32 %op8, %op12
	ld.w $t0, $fp, -86
	ld.w $t1, $fp, -103
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op14 = add i32 %op9, 1
	ld.w $t0, $fp, -90
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -111
# br label %label_6
	ld.w $a0, $fp, -107
	st.w $a0, $fp, -86
	ld.w $a0, $fp, -111
	st.w $a0, $fp, -90
	b .main_label_6
.main_label15:
# %op1 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -119
# br label %label_3
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -80
	b .main_label_3
mainEnd__Label:
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
