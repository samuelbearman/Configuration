syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set ruler

let mapleader = "\<Space>"
map <Space> <Leader>
noremap <Space> <NOP>

nnoremap <Leader>w :w!<CR>
nnoremap <Leader>x :x!<CR>
nnoremap <Leader>q :q!<CR>

vnoremap <expr> > (mode() ==# 'v' ? '>gv' : '>')
vnoremap <expr> < (mode() ==# 'v' ? '<gv' : '<')