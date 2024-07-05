.global _start

.section .text
_start:

movq $0,%rdx
cmp $2,(size)
jbe VERYGOOD_HW1

.Parameters_section_HW1:
	leaq (series),%r15 
	movl (%r15),%r14d
	movl 4(%r15),%r13d
	movl 8(&r15),%r12d
	imul $-2, %r13d, %r11d
	add %r14d, %r11d
	add %r12d, %r11d
	
	movl %r12d,%rax
	sub %r13d,%rax
	movl %r13d,%r9d
	sub %r14d,%r9d
	div %r9d
	movl %rax,%r8d
	
	movl %r12d, %rax
	div %r13d
	movl %rax, %r9d 
	movl %r13d, %rax
	div %r14d
	sub %rax, %r9d
	
	imul %r12d, %r14d 
	imul %r13d, %r13d 
	movl %r14d, %rax
	div %r13d
	movl %rax, %r10d
	
	
movq (size), %rcx
movq $2, %r15
leaq series,%rbx 

.DiffLoop1_HW1:

	movl (%rbx,%r15,4),%r14d
	movl -4(%rbx,%r15,4),%r13d
	movl -8(%rbx,%r15,4),%r12d
	
	sub %r13d, %r14d
	sub %r12d, %r13d
	sub %r13d, %r14d
	cmp %r14d, %r11d
	jne PreDiffLoop2_HW1

inc %r15
cmp %rcx, %r15
jne DiffLoop1_HW1

jmp VERYGOOD_HW1



.PreDiffLoop2_HW1:
movq $2, %r15

.DiffLoop2_HW1:


	movl (%rbx,%r15,4),%r14d
	movl -4(%rbx,%r15,4),%r13d
	movl -8(%rbx,%r15,4),%r12d
	
	sub %r13d, %r14d
	sub %r12d, %r13d
	movq %r14d, %eax
	idiv %r13d
	cmp %eax, %r8d
	jne PrePortionLoop1_HW1

inc %r15
cmp %rcx, %r15
jne DiffLoop2_HW1

jmp VERYGOOD_HW1




.PrePortionLoop1_HW1:
movq $2, %r15

.PortionLoop1_HW1:


	movl (%rbx,%r15,4),%r14d
	movl -4(%rbx,%r15,4),%r13d
	movl -8(%rbx,%r15,4),%r12d
	
	movl %r14d, %eax
	idiv %r13d
	movl %eax, %r14d
	
	movl %r13d, %eax
	idiv %r12d
	movl %eax, %r13d
	
	sub %r13d, %r14d 
	
	cmp %r14d, %r9d
	
	jne PrePortionLoop2_HW1

inc %r15
cmp %rcx, %r15
jne PortionLoop1_HW1

jmp VERYGOOD_HW1







.PrePortionLoop2_HW1:
movq $2, %r15


.PortionLoop2_HW1:



	movl (%rbx,%r15,4),%r14d
	movl -4(%rbx,%r15,4),%r13d
	movl -8(%rbx,%r15,4),%r12d
	
	
	movl %r14d, %eax
	idiv %r13d
	movl %eax, %r14d
	
	movl %r13d, %eax
	idiv %r12d
	movl %eax, %r13d
	
	movl %r14d, %eax
	
	idiv %r13d 
	
	cmp %eax, %r10d
	jne VERYBAD_HW1

inc %r15
cmp %rcx, %r15
jne PortionLoop2_HW1

jmp VERYGOOD_HW1



.VERYGOOD:
movb $1, (seconddegree)
jmp Exit_HW1

.VERYBAD_HW1:
movb $0, (seconddegree)
jmp Exit_HW1


.Exit_HW1:
