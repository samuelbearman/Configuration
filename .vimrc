syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler

let mapleader = "\<Space>"
map <Space> <Leader>
noremap <Space> <NOP>

nnoremap <Leader>w :w!<CR>
nnoremap <Leader>x :x!<CR>
nnoremap <Leader>q :q!<CR>

vnoremap <expr> > (mode() ==# 'v' ? '>gv' : '>')
vnoremap <expr> < (mode() ==# 'v' ? '<gv' : '<')

vnoremap <Leader>c :s/^/#/<CR>
