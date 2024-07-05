.global _start

.section .text		
_start:
	movl (Index), %ebx
	movl (length), %ecx 
	subl $1, %ecx
	cmpl %ebx, %ecx 
	ja Legal_HW1
	movb $0, (legal)
	j Exit
	
	Legal_HW1:
		movb $1, (Legal)
		movl Adress(,%ebx,4) %edx
		movl %edx, (num)
		
	
	Exit_HW1:
	
	