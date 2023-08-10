#!/bin/bash

echo "$1" | awk -F. '{print $1}' | base64 -D
echo "$1" | awk -F. '{print $2}' | base64 -D
echo "$1" | awk -F. '{print $3}' | base64 -D
