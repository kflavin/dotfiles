" -------------------------------
" Python specific settings
" -------------------------------
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
setlocal encoding=utf-8
setlocal foldmethod=indent
setlocal foldnestmax=2
"setlocal foldlevelstart=20
setlocal foldlevel=99
setlocal t_Co=256                "  256 Colors required for zenburn
let g:zenburn_high_Contrast=1    " Highlight all Python syntax
let g:zenburn_alternate_Visual=1 " I like the higher contrast bg
colorscheme zenburn              " Color theme

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Fill in the last character
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i

" Surround stuff in quotes
vnoremap <Leader>""" <esc>`>a<cr>"""<esc>`<^i"""<cr><esc>

" Delete stuff in quotes
nnoremap <Leader><Leader>""" :/"""<cr>:.g/"""/d<cr>N:.g/"""/d<cr>
