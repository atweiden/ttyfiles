" Source: https://gist.github.com/ddresselhaus/98b022e295bc27e9264dece7823e74e8
function! TestCmd(path, lineno)
  let cmd = join(["mix test --only", " line:", a:lineno, " ", a:path], "")
  return cmd
endfunction

nnoremap <leader>el :call TmuxSendKeys(TestCmd(expand("%:p"), line(".")))<CR>

packadd vim-elixir

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap: