call plug#begin('~/.local/share/nvim/plugged')

Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'sheerun/vim-polyglot'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'ambv/black'

call plug#end()

" recommended but I never use leader
" let mapleader=','

" recommended by vim-fish (not sure if nvim needs)
" syntax enable
" filetype plugin indent on

" plugin config
autocmd BufWritePre *.py execute ':Black'
let g:pymode_python = 'python3'
let g:pymode_run = 1

" Pylint configuration file
let g:pymode_options_max_line_length = 88
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1

" builtin vim config
set number
set tabstop=2 shiftwidth=2 expandtab
