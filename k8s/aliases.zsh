alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"
alias ka="kubectl get pods -A | grep -v -E '^kube-system|^kubernetes-dashboard|^prometheus|^rxv-system'"

alias bynode="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,NS:.metadata.namespace --sort-by=.spec.nodeName -A | grep -v -E 'kube-system$|kubernetes-dashboard$|prometheus$|rxv-system$'"
alias bypod="kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName,NS:.metadata.namespace --sort-by=.metadata.name -A | grep -v -E 'kube-system$|kubernetes-dashboard$|prometheus$|rxv-system$'"
alias byns="kubectl get pod -o=custom-columns=NS:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --sort-by=.metadata.namespace -A | grep -v -E '^kube-system|^kubernetes-dashboard|^prometheus|^rxv-system'"
