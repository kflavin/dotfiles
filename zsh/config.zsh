#fpath=($ZSH/functions $fpath)
#echo fpath=$fpath

# Source local bin files
for dir in $(find ~/.bin_local -type d); do
    PATH=$PATH:$dir
done
