

function publicip {
  aws ec2 describe-instances --query 'Reservations[*].Instances[].PublicIpAddress' --filter "Name=private-dns-name,Values=$1"
}
