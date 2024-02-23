alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"
alias ka="kubectl get pods -A | grep -v -E '^kube-system|^kubernetes-dashboard|^prometheus|^rxv-system'"
alias watchka="watch -n.1 \"kubectl get pods -A | grep -v -E '^kube-system|^kubernetes-dashboard|^prometheus|^rxv-system'\""
alias watchki="watch -n.1 'kubectl get ingress -A'"
alias ki="kubectl get ingress -A"
alias ks="kubectl get services -A"
alias kd="kubectl get deploy -A"
alias kr="kubectl get replicaset -A"
alias kds="kubectl get daemonsets -A"
alias kcm="kubectl get configmap -A"
alias kse="kubectl get secrets -A"
alias kaa="kubectl get pods -A"
alias kn="kubectl get nodes -o wide"

# namespace specific
alias kgi="kubectl get ingress"
alias kgs="kubectl get services"
alias kgd="kubectl get deploy"
alias kkgr="kubectl get replicaset"
alias kgds="kubectl get daemonsets"
alias kgc="kubectl get configmap"
alias kgs="kubectl get secrets"
alias kgp="kubectl get pods"


alias bynode="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,NS:.metadata.namespace --sort-by=.spec.nodeName -A | grep -v -E 'kube-system$|kubernetes-dashboard$|prometheus$|rxv-system$'"
alias bypod="kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName,NS:.metadata.namespace --sort-by=.metadata.name -A | grep -v -E 'kube-system$|kubernetes-dashboard$|prometheus$|rxv-system$'"
alias byns="kubectl get pod -o=custom-columns=NS:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --sort-by=.metadata.namespace -A | grep -v -E '^kube-system|^kubernetes-dashboard|^prometheus|^rxv-system'"

alias bynode-all='kubectl get pod -o="custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,NS:.metadata.namespace" --sort-by=.spec.nodeName -A'
alias bypod-all="kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName,NS:.metadata.namespace --sort-by=.metadata.name -A"
alias byns-all="kubectl get pod -o=custom-columns=NS:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --sort-by=.metadata.namespace -A"


#alias nodes='kubectl get nodes --sort-by=".metadata.labels.alpha\.eksctl\.io\/nodegroup-name" -o="custom-columns=NAME:.metadata.name,UNSCHEDULABLE:.spec.unschedulable,VERSION:.status.nodeInfo.kubeletVersion,ROLE:.spec.taints[].value,NODEGROUP:.metadata.labels.alpha\.eksctl\.io\/nodegroup-name,INSTANCE_TYPE:.metadata.labels.node\.kubernetes\.io\/instance-type,AZ:.metadata.labels.topology\.kubernetes\.io\/zone"'
# old alias with rolenames
#alias nodes='kubectl get nodes --sort-by=".metadata.labels.alpha\.eksctl\.io\/nodegroup-name" -o="custom-columns=NAME:.metadata.name,UNSCHEDULABLE:.spec.unschedulable,VERSION:.status.nodeInfo.kubeletVersion,ROLE:.spec.taints[].value,NODEGROUP:.metadata.labels.alpha\.eksctl\.io\/nodegroup-name,INSTANCE_TYPE:.metadata.labels.node\.kubernetes\.io\/instance-type,AZ:.metadata.labels.topology\.kubernetes\.io\/zone,ID:.metadata.annotations.csi\.volume\.kubernetes\.io\/nodeid" | sed -E "s/{\"efs.csi.aws.com\":\"(i-[^\"]*)\"}/\1/"'
alias nodes='kubectl get nodes -o="custom-columns=\
NAME:.metadata.name,\
UNSCHEDULABLE:.spec.unschedulable,\
VERSION:.status.nodeInfo.kubeletVersion,\
INSTANCE_TYPE:.metadata.labels.node\.kubernetes\.io\/instance-type,\
AZ_ZONE:.topology.ebs.csi.aws.com\/zone,\
AZ_TOPO:.metadata.labels.topology\.kubernetes\.io\/zone,\
ID:.metadata.annotations.csi\.volume\.kubernetes\.io\/nodeid" | sed -E "s/{\"ebs.csi.aws.com\":\"(i-[^\"]*)\"}/\1/"'


# EKS Add on versions
alias kaddons='k -n kube-system describe daemonset aws-node efs-csi-node kube-proxy | grep Image: | rev | cut -d/ -f1 | rev'


function ksetns {
    k get ns "$1" || return 1
    k config set-context --current --namespace="$1"
}

alias kgetns='kubectl config view --minify --output "jsonpath={..namespace}{\"\n\"}"'
