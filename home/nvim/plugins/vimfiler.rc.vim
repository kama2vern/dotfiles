" default explore -> vimfiler
let g:vimfiler_as_default_explorer = 1

" ignore .git .DS_Store files
let g:vimfiler_ignore_pattern = '^\%(.git\|.DS_Store\)$'

" buffer directory
nnoremap <silent> fe :<C-u>VimFilerBufferDir -quit<CR>

" Nerdtree like
nnoremap <C-e> :<C-u>VimFilerBufferDir -split -winwidth=45 -toggle -no-quit<CR>

" remap enter to expand or edit
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
