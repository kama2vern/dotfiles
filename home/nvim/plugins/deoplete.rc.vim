set completeopt-=preview

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_camel_case = 0
" let g:deoplete#enable_ignore_case = 0
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <BS>: close popup and delete backword char.
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" Use auto delimiter
call deoplete#custom#set('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
\ ])


call deoplete#custom#var('enable_at_startup', v:true)
call deoplete#custom#var('auto_complete_delay', v:false)
call deoplete#custom#var('auto_complete_start_length' v:true)
call deoplete#custom#var('enable_camel_case', v:false)
call deoplete#custom#var('enable_ignore_case', v:false)
call deoplete#custom#var('enable_refresh_always', v:false)
call deoplete#custom#var('enable_smart_case', v:true)
call deoplete#custom#var('file', 'enable_buffer_path', v:true)
