" -----------------------------------------------------------------------
" indent settings
" -----------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set showmatch
set scrolloff=10

set foldmethod=indent
set foldlevel=99
set clipboard+=unnamed
set backspace=start,eol,indent

nnoremap <C-p> :<C-u>set paste<CR>

" -----------------------------------------------------------------------
"  display settings
" -----------------------------------------------------------------------
syntax on

set t_Co=256
set number
set showcmd
set notitle
set laststatus=2
set foldmethod=marker

filetype plugin indent on
filetype indent on
