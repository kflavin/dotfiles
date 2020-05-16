#!/bin/bash


HOST=$1
PORT=${2-443}

for v in ssl2 ssl3 tls1 tls1_1 tls1_2; do
 for c in $(openssl ciphers 'ALL:eNULL' | tr ':' ' '); do
 #echo openssl s_client -connect $HOST:$PORT -cipher $c -$v # < /dev/null > /dev/null 2>&1 && echo -e "$v:\t$c"
 openssl s_client -connect $HOST:$PORT -cipher $c -$v #< /dev/null > /dev/null 2>&1 && echo -e "$v:\t$c"
 done
done
