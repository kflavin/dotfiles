# Installing dotfiles

```bash
# Clone repository into ~/.dotfiles
git clone git@github.com:kflavin/vim.git ~/.dotfiles

#Initialize dotfiles
./script/bootstrap.sh

# Install packages
./script/install.sh
```

`setup.sh` contains old commands.


### Add new submodule to vim

git submodule add git://github.com/tpope/vim-commentary.git vim/vim.symlink/bundle/commentary
