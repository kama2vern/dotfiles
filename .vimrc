" -----------------------------------------------------------------------
" plugin settings
" -----------------------------------------------------------------------
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim' }
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete'

call unite#set_profile('default', 'ignorecase', 1)
call unite#set_profile('default', 'smartcase', 1)

filetype plugin indent on
filetype indent on

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

" -----------------------------------------------------------------------
" Unite
" -----------------------------------------------------------------------
let g:unite_enable_start_insert=1
nnoremap <C-o> :<C-u>Unite file_rec<CR>
nnoremap <C-b> :<C-u>Unite buffer<CR>
