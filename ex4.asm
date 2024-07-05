.global _start

.section .text
_start:

leaq nodes, %rax

movq (nodes), %rbx

.FindHead_HW1:

	movq (%rbx), %rcx 
	testq %rcx, %rcx 
	jz IsHead_HW1

	movq %rcx, %rbx 
	jmp FindHead_HW1


.IsHead_HW1:

movq $3, %r15
movb $0, %r14b

.GeneralLoop_HW1:

	movq (%rax), %rcx


	movq %rbx, %r8
	movq 12(%rbx), %rdx 

	cmp %r8,%rcx 
	je PreHigherList_HW1


.LowerListCheck_HW1:

	cmp %rdx, %rcx
	je PreHigherList_HW1:


	movb 8(%r8), %r9b
	movb 8(%rdx), %r10b

	cmp %r9b, %r10b
	jg Increase_HW1
	jl Decrease_HW1

	movq %rdx, %r8
	movq 12(%rdx), %rdx

jmp LowerListCheck_HW1



.PreHigherList_HW1:

	movq 12(%rcx), %r8
	testq %r8, %r8 
	jz GOOD_HW1
	
	movq 12(%r8), %rdx 

	movq $0, %rcx

.HigherListCheck_HW1:

	testq %rdx, %rdx 
	jz GOOD_HW1

	movb 8(%r8), %r9b
	movb 8(%rdx), %r10b

	cmp %r9b, %r10b
	jg Increase_HW1
	jl Decrease_HW1


	movq %rdx, %r8
	movq 12(%rdx), %rdx
	
jmp HigherListCheck_HW1


.Increase_HW1:

	cmp %rdx, %rcx
	jz GOOD_HW1

	movb 8(%r8), %r9b
	movb 8(%rdx), %r10b

	cmp %r9b, %r10b
	jl BAD_HW1

	movq %rdx, %r8
	movq 12(%rdx), %rdx

jmp Increase_HW1



.Decrease_HW1:

	cmp %rdx, %rcx
	jz GOOD_HW1

	movb 8(%r8), %r9b
	movb 8(%rdx), %r10b

	cmp %r9b, %r10b
	jg BAD_HW1

	movq %rdx, %r8
	movq 12(%rdx), %rdx

jmp Decrease_HW1



.GOOD_HW1:

testq %rcx, %rcx 
jnz PreHigherList_HW1

add $1, %r14b
sub $1, %r15

testq %r15, %r15 
jz Finito_HW1

add $8, %rax

jmp GeneralLoop_HW1


.BAD_HW1:

sub $1, %r15

testq %r15, %r15 
jz Finito_HW1

add $8, %rax

jmp GeneralLoop_HW1


.Finito_HW1:
movb %r14b, (result)