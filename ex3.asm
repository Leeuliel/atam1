.global _start

.section .text
_start:

movq $1, %rax
movq $0, %rbx 

leaq root, %r8

.Level1_HW1:
	movq (%r8), %r9
	testq %r9, %r9
	leaq RichTest, %rcx
	jz IsLeaf_HW1
	
	
	.Loop1_HW1:

		add $1, %rax
		jmp Level2_HW1
		
		.NextLevel1:

		add $8, %r8
		movq (%r8), %r9
		
		testq %r9, %r9
		jnz Loop1_HW1
		
		jmp RichTest
		
		
.Level2_HW1:

	movq (%r9), %r10
	testq %r10, %r10
	leaq NextLevel1, %rcx
	jz IsLeaf_HW1

	.Loop2_HW1:
		add $1, %rax
		jmp Level3_HW1
	
		.NextLevel2:
	
		add $8, %r9
		movq (%r9), %r10
		
		testq %r10, %r10 
		jnz Loop2_HW1
		
		jmp NextLevel1

.Level3_HW1:
	movq (%r10), %r11
	testq %r11, %r11
	leaq NextLevel2, %rcx
	jz IsLeaf_HW1

	.Loop3_HW1:
		add $1, %rax
		jmp Level4_HW1
	
		.NextLevel3:
	
		add $8, %r10
		movq (%r10), %r11
		
		testq %r11, %r11
		jnz Loop3_HW1
		
		jmp NextLevel2


.Level4_HW1:

	movq (%r11), %r12
	testq %r12, %r12
	leaq NextLevel3, %rcx
	jz IsLeaf_HW1
	
	.Loop4_HW1:

		add $1, %rax
		jmp Level5_HW1
	
		.NextLevel4:
	
		add $8, %r11
		movq (%r11), %r12
		
		testq %r12, %r12
		jnz Loop4_HW1
		
		jmp NextLevel3


.Level5_HW1:
	leaq NextLevel4, %rcx
	jmp IsLeaf_HW1
		
	
.IsLeaf_HW1:
add $1, %rbx
jmp* %rcx


.RichTest:
movq $0, %rdx
div %rbx 

cmp $3, %rax
ja NotRich_HW1

je LastCheck_HW1

jmp IsRich

.NotRich_HW1:
mov $0, (rich)
jmp Exit_HW1


.LastCheck_HW1:
testq %rdx, %rdx 
jnz NotRich_HW1
jmp IsRich		

.IsRich:
mov $1, (rich)

.Exit_HW1: