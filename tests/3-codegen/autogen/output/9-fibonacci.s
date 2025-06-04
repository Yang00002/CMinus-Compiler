	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = alloca i32
	addi.d $t0, $fp, -32
	st.d $t0, $fp, -28
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# %op3 = icmp eq i32 %op2, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -37
# br i1 %op3, label %label_1, label %label_2
	ld.b $t0, $fp, -37
	bnez $t0, .fibonacci_label_1
	beqz $t0, .fibonacci_label_2
.fibonacci_label_1:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacciEnd__Label
.fibonacci_label_2:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -41
# %op5 = icmp eq i32 %op4, 1
	ld.w $t0, $fp, -41
	addi.w $t1, $zero, 1
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -42
# br i1 %op5, label %label_4, label %label_5
	ld.b $t0, $fp, -42
	bnez $t0, .fibonacci_label_4
	beqz $t0, .fibonacci_label_5
.fibonacci_label_3:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacciEnd__Label
.fibonacci_label_4:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacciEnd__Label
.fibonacci_label_5:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -46
# %op7 = sub i32 %op6, 1
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -50
# %op8 = call i32 @fibonacci(i32 %op7)
	ld.w $a0, $fp, -50
	bl fibonacci
	st.w $a0, $fp, -54
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -58
# %op10 = sub i32 %op9, 2
	ld.w $t0, $fp, -58
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -62
# %op11 = call i32 @fibonacci(i32 %op10)
	ld.w $a0, $fp, -62
	bl fibonacci
	st.w $a0, $fp, -66
# %op12 = add i32 %op8, %op11
	ld.w $t0, $fp, -54
	ld.w $t1, $fp, -66
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -70
# ret i32 %op12
	ld.w $a0, $fp, -70
	b fibonacciEnd__Label
.fibonacci_label_6:
# br label %label_3
	b .fibonacci_label_3
fibonacciEnd__Label:
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
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_8
	b .main_label_8
.main_label_7:
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -44
# %op3 = call i32 @fibonacci(i32 %op2)
	ld.w $a0, $fp, -44
	bl fibonacci
	st.w $a0, $fp, -48
# call void @output(i32 %op3)
	ld.w $a0, $fp, -48
	bl output
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = add i32 %op4, 1
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# store i32 %op5, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
# br label %label_8
	b .main_label_8
.main_label_8:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -60
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op8 = icmp slt i32 %op6, %op7
	ld.w $t0, $fp, -60
	ld.w $t1, $fp, -64
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -65
# br i1 %op8, label %label_7, label %label_9
	ld.b $t0, $fp, -65
	bnez $t0, .main_label_7
	beqz $t0, .main_label_9
.main_label_9:
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
