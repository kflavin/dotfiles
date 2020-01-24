#!/bin/bash

if [[ ! -n $1 ]]; then
    echo "Usage: $0 <access key id to lookup>"
    exit 1
fi

echo "Looking up key, this may take several minutes depending on the number of IAM users in your account..."

for u in $(aws iam list-users --query 'Users[*].UserName' --output text); do
    values=$(aws iam list-access-keys --user $u --output json --query 'AccessKeyMetadata[*].[UserName,AccessKeyId]' | jq -r '.[][]')
    IFS=$'\n' read -d '' -r -a arr <<< "$values"
    user=${arr[0]}
    key=${arr[1]}

    if [[ "$key" == "$1" ]]; then
        echo "$key belongs to ${user}"
        exit 0
    fi
done

echo "Could not find an owner".
exit 1

