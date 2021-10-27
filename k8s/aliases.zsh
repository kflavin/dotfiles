alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"
alias ka="kubectl get pods -A"

alias nodepod="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name -A | sort"
alias podnode="kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName -A | sort"
