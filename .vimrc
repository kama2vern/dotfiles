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

"-------------------
" neocomplete & neosnippet
"-------------------
" use neocomplete
let g:neocomplete#enable_at_startup = 1
" use smartcase
let g:neocomplete#enable_smart_case = 1
" set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default'   : '',
    \ 'vimshell'  : $HOME.'/.vimshell_hist',
    \ 'scheme'    : $HOME.'/.gosh_completions',
    \ 'ocaml'     : $HOME.'/.vim/dict/ocaml.dict'
    \ }
" define keyword
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" directory user defined snippets saved
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
" plugin key-mappings
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" <C-k> : snippet
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" for snippet_complete marker
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" <C-h>, <BS> : erase completed str
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" <C-y> : close popup
inoremap <expr><C-y>  neocomplete#close_popup()
" <C-e> : cancel completion
inoremap <expr><C-e>  neocomplete#cancel_popup()
" <Space> : close popup and insert <Space> if completion
inoremap <expr><Space>  pumvisible() ? neocomplete#close_popup()."\<Space>" : "\<Space>"
" <CR> : close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" enable omni completion
autocmd FileType css            setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python         setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags

" enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
