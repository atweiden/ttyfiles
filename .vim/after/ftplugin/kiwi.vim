setlocal dictionary=$CFGPATH/dict/fennel.dict
setlocal iskeyword-=-

function! s:HighlightKiwi() abort
  " seoul256
  highlight clear fennelKiwiKeyword
  highlight default link fennelKiwiKeyword rubyPredefinedIdentifier
  highlight clear fennelKiwiDefKeyword
  highlight default link fennelKiwiDefKeyword rubyRegexp
endfunction

augroup highlightkiwi
  autocmd!
  autocmd ColorScheme * call <SID>HighlightKiwi()
augroup END

call <SID>HighlightKiwi()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
