syntax on
set nowrap
set encoding=utf8

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Utility
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('vim-airline/vim-airline')

  " Go Support
  call dein#add('fatih/vim-go')

  " Color Scheme
  call dein#add('tomasiser/vim-code-dark')
  call dein#add('cocopon/iceberg.vim')

  " Clean unnecessary plugins
  call map(dein#check_clean(), "delete(v:val, 'rf')")

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" -----------------------------------------------------------------------
" indent settings
" -----------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
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
set t_Co=256
set t_ut=
colorscheme iceberg
"colorscheme codedark

set number
set showcmd
set notitle
set laststatus=2
set showtabline=2
set foldmethod=marker
set cursorline

" vim-go
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Filer
let g:vimfiler_as_default_explorer = 1
noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=41 -no-quit<ENTER>
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)

filetype indent on

