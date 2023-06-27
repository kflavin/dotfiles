# Homebrew.  Put this first, but then allow shims to be prepended later on.
# M1 is using /opt/homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
eval "$(/usr/local/bin/brew shellenv)"

#export PATH="$PATH:$HOME/.dotfiles/bin"
mkdir -p ~/.bin_local
export PATH="$PATH:$HOME/.bin_local:$HOME/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kyleflavin/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

