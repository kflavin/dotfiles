#!/bin/bash


if [[ -z $1 ]]; then
    echo "Usage: $0 <app>"
    exit 1
fi

app=$1

dynos=$(heroku ps -a "$app" --json | jq -r '.[].name')

for dyno in $dynos; do
    echo Restarting $dyno...
    heroku ps:restart -a $app $dyno
done


