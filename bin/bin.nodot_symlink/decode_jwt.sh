#!/bin/bash

echo "$1" | awk -F. '{printf $1}' | base64 -D
echo

length=$(echo -n "$1" | awk -F. '{printf $2}' | wc -m | tr -d ' ')
payload=$(echo -n "$1" | awk -F. '{printf $2}')

if [[ $(($length % 2)) -eq 1 ]]; then
    payload="$payload="
elif [[ $(($length % 4)) -eq 2 ]]; then
    payload="$payload=="
fi

echo -n "$payload" | base64 -D | sed -E 's/(.*)/\1\n/' | jq 'with_entries(if .key == "created" or .key == "exp" then .value |= strftime("%Y-%m-%d %H:%M:%S") else . end)'
echo

# signature
#echo "$1" | awk -F. '{printf $3}'
