	.file	1 "hw1.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:						
	.frame	$fp,48,$31		# vars= 40, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	addiu	$sp,$sp,-48		
	sw	$fp,44($sp)			
	move	$fp,$sp			
	sw	$0,4($fp)			
	li	$2,120				
	sw	$2,8($fp)			
	li	$2,24				
	sw	$2,12($fp)			
	lw	$3,8($fp)			
	lw	$2,12($fp)			
	addu	$2,$3,$2		
	sw	$2,16($fp)			
	lw	$3,8($fp)			
	lw	$2,12($fp)			
	subu	$2,$3,$2		
	sw	$2,20($fp)			
	lw	$3,8($fp)			
	lw	$2,12($fp)			
	mul	$2,$3,$2			
	sw	$2,24($fp)			
	lw	$2,12($fp)			
	beq	$2,$0,$L2			
	nop

	lw	$2,8($fp)			
	mtc1	$2,$f0			
	cvt.s.w	$f2,$f0			
	lw	$2,12($fp)			
	mtc1	$2,$f0			
	cvt.s.w	$f0,$f0			
	div.s	$f0,$f2,$f0		
	swc1	$f0,28($fp)		
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L2:						
	li	$2,88				
	sb	$2,3($fp)			
$L3:
	lw	$2,8($fp)			
	sll	$2,$2,2				
	sw	$2,32($fp)			
	lw	$3,12($fp)			
	lw	$2,8($fp)			
	and $2,$3,$2			
	nor	$2,$0,$2			
	sw	$2,36($fp)			
	move	$2,$0			
	move	$sp,$fp			
	lw	$fp,44($sp)			
	addiu	$sp,$sp,48		
	jr	$31					
	nop
	.set	nomacro

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
