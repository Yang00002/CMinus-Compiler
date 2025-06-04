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
	addi.d $sp, $sp, -96
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -44
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = icmp eq i32 %op4, 0
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	slt  $t2, $t0, $t1
	slt  $t3, $t1, $t0
	add.w $t1, $t2, $t3
	add.w $t0, $zero, $zero
	bnez $t1, labelBr__0
	addi.w $t0, $t0, 1
labelBr__0:
	st.b $t0, $fp, -53
# br i1 %op5, label %label_1, label %label_2
	ld.b $t0, $fp, -53
	bnez $t0, .gcd_label_1
	beqz $t0, .gcd_label_2
.gcd_label_1:
# %op6 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -57
# ret i32 %op6
	ld.w $a0, $fp, -57
	b gcdEnd__Label
.gcd_label_2:
# %op7 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# %op8 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# %op11 = sdiv i32 %op9, %op10
	ld.w $t0, $fp, -69
	ld.w $t1, $fp, -73
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op12 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -81
# %op13 = mul i32 %op11, %op12
	ld.w $t0, $fp, -77
	ld.w $t1, $fp, -81
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op14 = sub i32 %op8, %op13
	ld.w $t0, $fp, -65
	ld.w $t1, $fp, -85
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op15 = call i32 @gcd(i32 %op7, i32 %op14)
	ld.w $a0, $fp, -61
	ld.w $a1, $fp, -89
	bl gcd
	st.w $a0, $fp, -93
# ret i32 %op15
	ld.w $a0, $fp, -93
	b gcdEnd__Label
.gcd_label_3:
# ret i32 0
	addi.w $a0, $zero, 0
	b gcdEnd__Label
gcdEnd__Label:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# %op3 = alloca i32
	addi.d $t0, $fp, -56
	st.d $t0, $fp, -52
# %op4 = alloca i32
	addi.d $t0, $fp, -68
	st.d $t0, $fp, -64
# %op5 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -76
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -76
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -80
# store i32 %op6, i32* %op2
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -80
	st.w $t1, $t0, 0
# %op7 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -88
# %op8 = load i32, i32* %op7
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -92
# store i32 %op8, i32* %op3
	ld.d $t0, $fp, -52
	ld.w $t1, $fp, -92
	st.w $t1, $t0, 0
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -40
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -96
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -100
# %op11 = icmp slt i32 %op9, %op10
	ld.w $t0, $fp, -96
	ld.w $t1, $fp, -100
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -101
# br i1 %op11, label %label_4, label %label_5
	ld.b $t0, $fp, -101
	bnez $t0, .funArray_label_4
	beqz $t0, .funArray_label_5
.funArray_label_4:
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -40
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -105
# store i32 %op12, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -105
	st.w $t1, $t0, 0
# %op13 = load i32, i32* %op3
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -109
# store i32 %op13, i32* %op2
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -109
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -113
# store i32 %op14, i32* %op3
	ld.d $t0, $fp, -52
	ld.w $t1, $fp, -113
	st.w $t1, $t0, 0
# br label %label_5
	b .funArray_label_5
.funArray_label_5:
# %op15 = load i32, i32* %op2
	ld.d $t0, $fp, -40
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -117
# %op16 = load i32, i32* %op3
	ld.d $t0, $fp, -52
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -121
# %op17 = call i32 @gcd(i32 %op15, i32 %op16)
	ld.w $a0, $fp, -117
	ld.w $a1, $fp, -121
	bl gcd
	st.w $a0, $fp, -125
# ret i32 %op17
	ld.w $a0, $fp, -125
	b funArrayEnd__Label
funArrayEnd__Label:
	addi.d $sp, $sp, 128
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
