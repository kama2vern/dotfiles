if &compatible
  set nocompatible               " Be iMproved
endif

if has('nvim')
  let s:dein_cache_path = expand('~/.cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/.cache/vim/dein')
endif

let s:dein_dir = s:dein_cache_path
                 \ .'repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})

  " Clean unnecessary plugins
  call map(dein#check_clean(), "delete(v:val, 'rf')")

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" -----------------------------------------------------------------------
" key binding settings
" -----------------------------------------------------------------------
tnoremap <Esc> <C-\><C-n>

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
set autowrite
set splitbelow

" -----------------------------------------------------------------------
"  display settings
" -----------------------------------------------------------------------
set t_Co=256
set t_ut=
colorscheme iceberg

set number
set showcmd
set notitle
set laststatus=2
set showtabline=2
set foldmethod=marker
set cursorline
set mouse=a

autocmd FileType gitcommit DiffGitCached | resize 30

filetype indent on

