set shiftwidth=2
set softtabstop=2

function! Fixtabs()
    " Retab HTML to use 2 spaces instead of 4.
    set noexpandtab
    set tabstop=4
    set shiftwidth=4
    retab!
    set tabstop=2
    set shiftwidth=2
    set expandtab
    retab!
endfunction
