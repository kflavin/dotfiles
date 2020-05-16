
# read output from "heroku config -a rxvantage-api-test"

$APP=$1
$FILE=$2

IFS=
while read -r line; do
key=$(echo $line | cut -f1 -d:)
value=$(echo $line | rev | cut -d' ' -f1 | rev)
heroku config:set -a ${APP} "$key"="$value"
done <<< $(cat $FILE)
