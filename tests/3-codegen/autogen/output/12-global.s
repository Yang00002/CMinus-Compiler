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
.randBin_label_3:
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
	addi.d $sp, $sp, -96
.returnToZeroSteps_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_5
	b .returnToZeroSteps_label_5
.returnToZeroSteps_label_4:
# %op2 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -44
# %op3 = icmp ne i32 %op2, 0
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	beqz $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -45
# br i1 %op3, label %label_7, label %label_8
	ld.b $t0, $fp, -45
	bnez $t0, .returnToZeroSteps_label_7
	beqz $t0, .returnToZeroSteps_label_8
.returnToZeroSteps_label_5:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -49
# %op5 = icmp slt i32 %op4, 20
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 20
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -50
# br i1 %op5, label %label_4, label %label_6
	ld.b $t0, $fp, -50
	bnez $t0, .returnToZeroSteps_label_4
	beqz $t0, .returnToZeroSteps_label_6
.returnToZeroSteps_label_6:
# ret i32 20
	addi.w $a0, $zero, 20
	b returnToZeroStepsEnd__Label
.returnToZeroSteps_label_7:
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -54
# %op7 = add i32 %op6, 1
	ld.w $t0, $fp, -54
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -58
# store i32 %op7, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -58
	st.w $t1, $t0, 0
# br label %label_9
	b .returnToZeroSteps_label_9
.returnToZeroSteps_label_8:
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -62
# %op9 = sub i32 %op8, 1
	ld.w $t0, $fp, -62
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -66
# store i32 %op9, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -66
	st.w $t1, $t0, 0
# br label %label_9
	b .returnToZeroSteps_label_9
.returnToZeroSteps_label_9:
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -70
# %op11 = add i32 %op10, 1
	ld.w $t0, $fp, -70
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -74
# store i32 %op11, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -74
	st.w $t1, $t0, 0
# %op12 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -78
# %op13 = icmp eq i32 %op12, 0
	ld.w $t0, $fp, -78
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -79
# br i1 %op13, label %label_10, label %label_11
	ld.b $t0, $fp, -79
	bnez $t0, .returnToZeroSteps_label_10
	beqz $t0, .returnToZeroSteps_label_11
.returnToZeroSteps_label_10:
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -83
# ret i32 %op14
	ld.w $a0, $fp, -83
	b returnToZeroStepsEnd__Label
.returnToZeroSteps_label_11:
# br label %label_5
	b .returnToZeroSteps_label_5
returnToZeroStepsEnd__Label:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# br label %label_13
	b .main_label_13
.main_label_12:
# %op1 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
	st.w $a0, $fp, -32
# call void @output(i32 %op1)
	ld.w $a0, $fp, -32
	bl output
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# %op3 = add i32 %op2, 1
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -40
	st.w $t1, $t0, 0
# br label %label_13
	b .main_label_13
.main_label_13:
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -44
# %op5 = icmp slt i32 %op4, 20
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 20
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -45
# br i1 %op5, label %label_12, label %label_14
	ld.b $t0, $fp, -45
	bnez $t0, .main_label_12
	beqz $t0, .main_label_14
.main_label_14:
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
