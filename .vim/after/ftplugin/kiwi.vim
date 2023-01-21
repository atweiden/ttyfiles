vim9script

setlocal dictionary=$CFGPATH/dict/fennel.dict
setlocal iskeyword-=-

def HighlightKiwi(): void
  # seoul256
  highlight clear fennelKiwiKeyword
  highlight default link fennelKiwiKeyword rubyPredefinedIdentifier
  highlight clear fennelKiwiDefKeyword
  highlight default link fennelKiwiDefKeyword rubyRegexp
enddef

augroup highlightkiwi
  autocmd!
  autocmd ColorScheme * HighlightKiwi()
augroup END

HighlightKiwi()

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
