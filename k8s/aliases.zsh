alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"
alias ka="kubectl get pods -A | grep -v -E '^kube-system|^kubernetes-dashboard|^prometheus|^rxv-system'"
alias kaa="kubectl get pods -A"

alias bynode="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,NS:.metadata.namespace --sort-by=.spec.nodeName -A | grep -v -E 'kube-system$|kubernetes-dashboard$|prometheus$|rxv-system$'"
alias bypod="kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName,NS:.metadata.namespace --sort-by=.metadata.name -A | grep -v -E 'kube-system$|kubernetes-dashboard$|prometheus$|rxv-system$'"
alias byns="kubectl get pod -o=custom-columns=NS:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --sort-by=.metadata.namespace -A | grep -v -E '^kube-system|^kubernetes-dashboard|^prometheus|^rxv-system'"

alias bynode-all='kubectl get pod -o="custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,NS:.metadata.namespace" --sort-by=.spec.nodeName -A'
alias bypod-all="kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName,NS:.metadata.namespace --sort-by=.metadata.name -A"
alias byns-all="kubectl get pod -o=custom-columns=NS:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --sort-by=.metadata.namespace -A"


alias nodes='kubectl get nodes --sort-by=".metadata.labels.eks\.amazonaws\.com\/nodegroup" -o="custom-columns=NAME:.metadata.name,UNSCHEDULABLE:.spec.unschedulable,VERSION:.status.nodeInfo.kubeletVersion,ROLE:.spec.taints[].value,NODEGROUP:.metadata.labels.eks\.amazonaws\.com\/nodegroup,INSTANCE_TYPE:.metadata.labels.node\.kubernetes\.io\/instance-type"'


# EKS Add on versions
alias kaddons='k -n kube-system describe daemonset aws-node efs-csi-node kube-proxy | grep Image: | rev | cut -d/ -f1 | rev'
