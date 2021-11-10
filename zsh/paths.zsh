#export PATH="$PATH:$HOME/.dotfiles/bin"
mkdir -p ~/.bin_local
export PATH="$PATH:$HOME/.bin_local:$HOME/bin"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
