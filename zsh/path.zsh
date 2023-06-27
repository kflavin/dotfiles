#export PATH="$PATH:$HOME/.dotfiles/bin"
mkdir -p ~/.bin_local
export PATH="$PATH:$HOME/.bin_local:$HOME/bin"

# Homebrew
export PATH="$PATH:/opt/homebrew/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kyleflavin/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
