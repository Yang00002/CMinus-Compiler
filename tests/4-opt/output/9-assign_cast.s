	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = icmp slt i32 1, 3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 3
	slt  $t0, $t0, $t1
	st.b $t0, $fp, -17
# %op1 = zext i1 %op0 to i32
	ld.b $t0, $fp, -17
	slt $t1, $t0, $zero
	beqz $t1, labelBr__0
	sub.w $t0, $zero, $t0
labelBr__0:
	st.w $t0, $fp, -21
# %op2 = sitofp i32 2 to float
	addi.w $t0, $zero, 2
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft0, $ft0
	fst.s $ft0, $fp, -25
# %op3 = fadd float %op2, 0x4003333340000000
	fld.s $ft0, $fp, -25
	lu12i.w $t8, 262553
	ori $t8, $t8, 2458
	movgr2fr.w $ft1, $t8
	fadd.s $ft0, $ft0, $ft1
	fst.s $ft0, $fp, -29
# %op4 = fptosi float %op3 to i32
	fld.s $ft0, $fp, -29
	ftintrz.w.s $ft0, $ft0
	movfr2gr.s $t0, $ft0
	st.w $t0, $fp, -33
# %op5 = add i32 %op1, %op4
	ld.w $t0, $fp, -21
	ld.w $t1, $fp, -33
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -37
# ret i32 %op5
	ld.w $a0, $fp, -37
	b mainEnd__Label
mainEnd__Label:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
