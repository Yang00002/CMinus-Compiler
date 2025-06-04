# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl seed
	.type seed, @object
	.size seed, 4
seed:
	.space 4
	.text
	.globl randomLCG
	.type randomLCG, @function
randomLCG:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randomLCG_label_entry:
# %op0 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -20
# %op1 = mul i32 %op0, 1103515245
	ld.w $t0, $fp, -20
	lu12i.w $t1, 269412
	ori $t1, $t1, 3693
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# %op2 = add i32 %op1, 12345
	ld.w $t0, $fp, -24
	lu12i.w $t1, 3
	ori $t1, $t1, 57
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# store i32 %op2, i32* @seed
	la.local $t0, seed
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op3 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -32
# ret i32 %op3
	ld.w $a0, $fp, -32
	b randomLCGEnd__Label
randomLCGEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl randBin
	.type randBin, @function
randBin:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randBin_label_entry:
# %op0 = call i32 @randomLCG()
	bl randomLCG
	st.w $a0, $fp, -20
# %op1 = icmp sgt i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt  $t0, $t1, $t0
	st.b $t0, $fp, -21
# br i1 %op1, label %label_1, label %label_2
	ld.b $t0, $fp, -21
	bnez $t0, .randBin_label_1
	beqz $t0, .randBin_label_2
.randBin_label_1:
# ret i32 1
	addi.w $a0, $zero, 1
	b randBinEnd__Label
.randBin_label_2:
# ret i32 0
	addi.w $a0, $zero, 0
	b randBinEnd__Label
randBinEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl returnToZeroSteps
	.type returnToZeroSteps, @function
returnToZeroSteps:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.returnToZeroSteps_label_entry:
# br label %label_5
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -25
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -29
	b .returnToZeroSteps_label_5
.returnToZeroSteps_label_4:
# %op0 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -20
# %op1 = icmp ne i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -21
# br i1 %op1, label %label_7, label %label_8
	ld.b $t0, $fp, -21
	bnez $t0, .returnToZeroSteps_label_7
	beqz $t0, .returnToZeroSteps_label_8
.returnToZeroSteps_label_5:
# %op2 = phi i32 [ 0, %label_entry ], [ %op8, %label_11 ]
# %op3 = phi i32 [ 0, %label_entry ], [ %op7, %label_11 ]
# %op4 = icmp slt i32 %op2, 20
	ld.w $t0, $fp, -25
	addi.w $t1, $zero, 20
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -30
# br i1 %op4, label %label_4, label %label_6
	ld.b $t0, $fp, -30
	bnez $t0, .returnToZeroSteps_label_4
	beqz $t0, .returnToZeroSteps_label_6
.returnToZeroSteps_label_6:
# ret i32 20
	addi.w $a0, $zero, 20
	b returnToZeroStepsEnd__Label
.returnToZeroSteps_label_7:
# %op5 = add i32 %op3, 1
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# br label %label_9
	ld.w $a0, $fp, -34
	st.w $a0, $fp, -42
	b .returnToZeroSteps_label_9
.returnToZeroSteps_label_8:
# %op6 = sub i32 %op3, 1
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -38
# br label %label_9
	ld.w $a0, $fp, -38
	st.w $a0, $fp, -42
	b .returnToZeroSteps_label_9
.returnToZeroSteps_label_9:
# %op7 = phi i32 [ %op5, %label_7 ], [ %op6, %label_8 ]
# %op8 = add i32 %op2, 1
	ld.w $t0, $fp, -25
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -46
# %op9 = icmp eq i32 %op7, 0
	ld.w $t0, $fp, -42
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -47
# br i1 %op9, label %label_10, label %label_11
	ld.b $t0, $fp, -47
	bnez $t0, .returnToZeroSteps_label_10
	beqz $t0, .returnToZeroSteps_label_11
.returnToZeroSteps_label_10:
# ret i32 %op8
	ld.w $a0, $fp, -46
	b returnToZeroStepsEnd__Label
.returnToZeroSteps_label_11:
# br label %label_5
	ld.w $a0, $fp, -46
	st.w $a0, $fp, -25
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -29
	b .returnToZeroSteps_label_5
returnToZeroStepsEnd__Label:
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
	addi.d $sp, $sp, -32
.main_label_entry:
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# br label %label_13
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label_13
.main_label_12:
# %op0 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
	st.w $a0, $fp, -20
# call void @output(i32 %op0)
	ld.w $a0, $fp, -20
	bl output
# %op1 = add i32 %op2, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# br label %label_13
	ld.w $a0, $fp, -24
	st.w $a0, $fp, -28
	b .main_label_13
.main_label_13:
# %op2 = phi i32 [ 0, %label_entry ], [ %op1, %label_12 ]
# %op3 = icmp slt i32 %op2, 20
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 20
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -29
# br i1 %op3, label %label_12, label %label_14
	ld.b $t0, $fp, -29
	bnez $t0, .main_label_12
	beqz $t0, .main_label_14
.main_label_14:
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
