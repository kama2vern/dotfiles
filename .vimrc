set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim' }

filetype plugin indent on
filetype indent on

set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set showmatch

set scrolloff=10

set foldmethod=indent
set foldlevel=99

set clipboard+=unnamed

syntax on

set t_Co=256
set number
set showcmd
set title

set laststatus=2
