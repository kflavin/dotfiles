# Homebrew.  Put this first, but then allow shims to be prepended later on.
# M1 is using /opt/homebrew

# M1 vs intel
# NOTE: This has caused some issues with nvm, because the path ends
# up placed in front of it.  I'm working around the issue by
# uninstalling system node.
if [[ -x /opt/homebrew/bin/brew ]]; then
    #export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

#export PATH="$PATH:$HOME/.dotfiles/bin"
mkdir -p ~/.bin_local
export PATH="$PATH:$HOME/.bin_local:$HOME/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kyleflavin/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

