# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl x
	.type x, @object
	.size x, 4
x:
	.space 4
	.globl y
	.type y, @object
	.size y, 4
y:
	.space 4
	.text
	.globl gcd
	.type gcd, @function
gcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
# %op2 = icmp eq i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -25
# br i1 %op2, label %label_1, label %label_2
	ld.b $t0, $fp, -25
	bnez $t0, .gcd_label_1
	beqz $t0, .gcd_label_2
.gcd_label_1:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b gcdEnd__Label
.gcd_label_2:
# %op3 = sdiv i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -29
# %op4 = mul i32 %op3, %arg1
	ld.w $t0, $fp, -29
	ld.w $t1, $fp, -24
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# %op5 = sub i32 %arg0, %op4
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -33
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -37
# %op6 = call i32 @gcd(i32 %arg1, i32 %op5)
	ld.w $a0, $fp, -24
	ld.w $a1, $fp, -37
	bl gcd
	st.w $a0, $fp, -41
# ret i32 %op6
	ld.w $a0, $fp, -41
	b gcdEnd__Label
gcdEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -40
# %op3 = load i32, i32* %op2
	ld.d $t0, $fp, -40
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -44
# %op4 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -52
# %op5 = load i32, i32* %op4
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op6 = icmp slt i32 %op3, %op5
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -56
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -57
# br i1 %op6, label %label_4, label %label_5
	ld.w $a0, $fp, -56
	st.w $a0, $fp, -61
	ld.w $a0, $fp, -44
	st.w $a0, $fp, -65
	ld.b $t0, $fp, -57
	bnez $t0, .funArray_label_4
	beqz $t0, .funArray_label_5
.funArray_label_4:
# br label %label_5
	ld.w $a0, $fp, -44
	st.w $a0, $fp, -61
	ld.w $a0, $fp, -56
	st.w $a0, $fp, -65
	b .funArray_label_5
.funArray_label_5:
# %op7 = phi i32 [ %op5, %label_entry ], [ %op3, %label_4 ]
# %op8 = phi i32 [ %op3, %label_entry ], [ %op5, %label_4 ]
# %op9 = call i32 @gcd(i32 %op8, i32 %op7)
	ld.w $a0, $fp, -65
	ld.w $a1, $fp, -61
	bl gcd
	st.w $a0, $fp, -69
# ret i32 %op9
	ld.w $a0, $fp, -69
	b funArrayEnd__Label
funArrayEnd__Label:
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
	addi.d $sp, $sp, -64
.main_label_entry:
# %op0 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -24
# store i32 90, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 90
	st.w $t1, $t0, 0
# %op1 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -32
# store i32 18, i32* %op1
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 18
	st.w $t1, $t0, 0
# %op2 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -40
# %op3 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# %op4 = call i32 @funArray(i32* %op2, i32* %op3)
	ld.d $a0, $fp, -40
	ld.d $a1, $fp, -48
	bl funArray
	st.w $a0, $fp, -52
# ret i32 %op4
	ld.w $a0, $fp, -52
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
