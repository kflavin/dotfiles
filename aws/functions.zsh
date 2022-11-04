

function publicip {
  aws ec2 describe-instances --query 'Reservations[*].Instances[].PublicIpAddress' --filter "Name=private-dns-name,Values=$1"
}


# These aren't very general, but I want to keep them in git.
function ghrunners {
  aws ec2 describe-instances --filter Name=tag:Name,Values=github-runner --query 'Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[?Primary==`true`].PrivateIpAddress[]' --no-cli-pager --output text
}


function checkrunners {
    jump 'bash -c "for i in '$(ghrunners)'; do echo \$i; ssh -o StrictHostKeyChecking=false \$i which docker; done"'
}


function instance_types {
    aws ec2 describe-instance-types | jq -r '["InstanceType", "VCpus", "Cores", "Mem", "EBS Opt", "Network"], (.InstanceTypes[] | [.InstanceType, .VCpuInfo.DefaultVCpus, .VCpuInfo.DefaultCores, .MemoryInfo.SizeInMiB, .EbsInfo.EbsOptimizedSupport, .NetworkInfo.NetworkPerformance]) | @tsv' | sort | more
}
