vim9script

g:better_whitespace_operator = '<leader>sw'

# disable whitespace highlights for specified filetypes
g:better_whitespace_filetypes_blacklist = [
  'diff',
  'help',
  'packager',
  'qf'
]

def HighlightBetterWhitespace(): void
  highlight clear ExtraWhitespace
  highlight ExtraWhitespace ctermbg=168
enddef

# seoul256 whitespace colors
augroup betterwhitespace
  autocmd!
  autocmd VimEnter,ColorScheme * HighlightBetterWhitespace()
augroup END

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
