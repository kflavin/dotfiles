#!/usr/bin/env bash

set -e
cd "$(dirname $0)/.."

echo $(pwd)

find . -name install.sh | while read installer; do echo "${installer}"; done
