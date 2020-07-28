" toggle rainbow parentheses
nnoremap <silent> <leader>sr :RainbowParentheses!!<CR>

let g:rainbow#max_level = 16
let g:rainbow#pairs = [
    \ ['(', ')'],
    \ ['[', ']']
    \ ]

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
