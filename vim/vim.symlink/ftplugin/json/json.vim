"com! FormatJSON %!python -m json.tool
com! FormatJSON %!python -c "from collections import OrderedDict; import sys; import json; j = json.load(sys.stdin, object_pairs_hook=OrderedDict); json.dump(j, sys.stdout, sort_keys=False, indent=4, separators=(',', ': '))"

" Turn off concealment of quotes
let g:vim_json_syntax_conceal = 0

setlocal foldmethod=syntax
set foldlevel=99
