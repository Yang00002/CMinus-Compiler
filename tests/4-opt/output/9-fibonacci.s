	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -21
# br i1 %op1, label %label_1, label %label_2
	ld.b $t0, $fp, -21
	bnez $t0, .fibonacci_label_1
	beqz $t0, .fibonacci_label_2
.fibonacci_label_1:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacciEnd__Label
.fibonacci_label_2:
# %op2 = icmp eq i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__1
	addi.w $t0, $t0, 1
labelBr__1:
	st.b $t0, $fp, -22
# br i1 %op2, label %label_4, label %label_5
	ld.b $t0, $fp, -22
	bnez $t0, .fibonacci_label_4
	beqz $t0, .fibonacci_label_5
.fibonacci_label_4:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacciEnd__Label
.fibonacci_label_5:
# %op3 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -26
# %op4 = call i32 @fibonacci(i32 %op3)
	ld.w $a0, $fp, -26
	bl fibonacci
	st.w $a0, $fp, -30
# %op5 = sub i32 %arg0, 2
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# %op6 = call i32 @fibonacci(i32 %op5)
	ld.w $a0, $fp, -34
	bl fibonacci
	st.w $a0, $fp, -38
# %op7 = add i32 %op4, %op6
	ld.w $t0, $fp, -30
	ld.w $t1, $fp, -38
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# ret i32 %op7
	ld.w $a0, $fp, -42
	b fibonacciEnd__Label
fibonacciEnd__Label:
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
# br label %label_8
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label_8
.main_label_7:
# %op0 = call i32 @fibonacci(i32 %op2)
	ld.w $a0, $fp, -28
	bl fibonacci
	st.w $a0, $fp, -20
# call void @output(i32 %op0)
	ld.w $a0, $fp, -20
	bl output
# %op1 = add i32 %op2, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# br label %label_8
	ld.w $a0, $fp, -24
	st.w $a0, $fp, -28
	b .main_label_8
.main_label_8:
# %op2 = phi i32 [ 0, %label_entry ], [ %op1, %label_7 ]
# %op3 = icmp slt i32 %op2, 10
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 10
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -29
# br i1 %op3, label %label_7, label %label_9
	ld.b $t0, $fp, -29
	bnez $t0, .main_label_7
	beqz $t0, .main_label_9
.main_label_9:
# ret i32 0
	addi.w $a0, $zero, 0
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
