" toggle rainbow_parentheses.vim
nnoremap <leader>rp :RainbowParentheses!!<CR>

let g:rainbow#max_level = 16
let g:rainbow#pairs = [
\   ['(', ')'],
\   ['[', ']'],
\   ['{', '}']
\ ]

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
