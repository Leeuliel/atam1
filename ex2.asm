.global _start

.section .text
_start:
	movq (size), %rax
	leaq data,%rbx
	
.Loop1_HW1: 	
	testq %rax,%rax
	jz Loop3_HW1
	
	movb (%rbx), %cl
	
	testb %cl, %cl
	jz FirstNullCheck_HW1
	
	cmp $32, %cl
	jl Loop3_HW1
	
	cmp $126, %cl 
	ja Loop3_HW1
	
	
	cmp $32, %cl
	jz Cond1Next_HW1
	
	cmp $33, %cl
	jz Cond1Next_HW1
	
	cmp $44, %cl
	jz Cond1Next_HW1


	cmp $46, %cl
	jz Cond1Next

	cmp $63, %cl
	jz Cond1Next_HW1

	cmp $32, %cl
	jz Cond1Next_HW1
		
	cmp $48, %cl
	jl Loop2_HW1
	
	
	cmp $57, %cl
	jle  Cond1Next_HW1
	
	
	
	cmp $65, %cl
	jl Loop2_HW1
	
	
	cmp $90, %cl
	jle  Cond1Next_HW1
	
	
	
	cmp $97, %cl
	jl Loop2_HW1
	
	
	cmp $122, %cl
	jle  Cond1Next_HW1
	
	
jmp	Loop2_HW1
	

	
.Cond1Next_HW1:

	subq $1,%rax
	add $1,%rbx
	jmp Loop1_HW1
	
	
	
.Loop2_HW1: 	

	testq %rax,%rax
	jz Loop3_HW1


	movb (%rbx), %cl
	
	testb %cl, %cl
	jz SecondNullCheck_HW1
	
	cmp $32, %cl
	jl Loop3_HW1
	
	cmp $126, %cl 
	ja Loop3_HW1


	subq $1,%rax
	add $1,%rbx
	jmp Loop2_HW1





.Loop3_HW1: 	
	movq (size), %rax
	leaq data,%rbx
	movq $0, %rdx 
	movq $8, %rcx 
	div %rcx  

	testq %rdx, %rdx
	jnz OtherWise_HW1
	
.InsideLoop3_HW1:

	testq %rax, %rax
	jz ThirdCondFinished_HW1

	movq (%rbx), %rcx

	testq %rcx, %rcx
	jz OtherWise_HW1
	

	subq $1,%rax
	add $8,%rbx
		
jmp InsideLoop3_HW1






.FirstNullCheck_HW1:
		cmp $1,%rax 
		jz FirstCondFinished_HW1
		jmp Loop3_HW1
	
	
.SecondNullCheck_HW1:
	cmp $1, %rax
	jz SecondCondFinished_HW1
	jmp Loop3_HW1




#number injuction#
.OtherWise_HW1:

movb $4, (type)
jmp Exit_HW1


.FirstCondFinished_HW1:
movb $1, (type)
jmp Exit_HW1


.SecondCondFinished_HW1:
movb $2, (type)
jmp Exit_HW1


.ThirdCondFinished_HW1:
movb $3, (type)
jmp Exit_HW1


.Exit_HW1: