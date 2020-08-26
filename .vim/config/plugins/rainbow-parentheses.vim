" facilitate lazy loading
augroup loadrainbowparentheses
  autocmd!
  autocmd User LoadRainbowParentheses ++once packadd rainbow_parentheses.vim
augroup END

" toggle rainbow parentheses
nnoremap <silent> <leader>sr :silent doautocmd User LoadRainbowParentheses<CR>:RainbowParentheses!!<CR>

let g:rainbow#max_level = 16
let g:rainbow#pairs = [
    \ ['(', ')'],
    \ ['[', ']']
    \ ]

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
