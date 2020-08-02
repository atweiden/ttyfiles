set background=dark
silent! colorscheme miro8
set guicursor=

" neovim {{{

if has('nvim')
  " set all cursors to 20% height unblinking block by default
  set guicursor+=a:blinkon0-hor20
  " set insert mode cursor to 25% width unblinking block
  set guicursor+=i:blinkon0-ver25
  " set :terminal cursor to URxvt-like underline
  highlight clear TermCursor
  highlight TermCursor ctermfg=red cterm=underline gui=underline
  highlight clear TermCursorNC
  highlight TermCursorNC ctermfg=red cterm=underline gui=underline
endif

" end neovim }}}

" highlighting {{{

" turn off any existing search
augroup searchhighlight
  autocmd!
  autocmd VimEnter * nohlsearch
augroup END

" searches
highlight clear Search
highlight Search term=bold cterm=bold ctermfg=0 ctermbg=116 gui=bold guifg=black guibg=#97DDDF
highlight clear IncSearch
highlight IncSearch term=bold cterm=bold ctermfg=0 ctermbg=217 gui=bold guifg=black guibg=#FFBFBD

" matching parens
highlight clear MatchParen
highlight MatchParen term=bold,NONE cterm=bold,NONE ctermfg=179 gui=bold,NONE guifg=#D7AF5F

" cursor line and column
highlight clear CursorLine
highlight CursorLine term=NONE cterm=NONE ctermbg=234 gui=NONE guibg=#FFFCFA
highlight clear CursorColumn
highlight CursorColumn term=NONE cterm=NONE ctermbg=234 gui=NONE guibg=#FFFCFA
highlight clear ColorColumn
highlight ColorColumn term=NONE cterm=NONE ctermbg=95 gui=NONE guibg=#875F5F

" error, warning and mode messages
highlight clear Error
highlight Error ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE
highlight clear ErrorMsg
highlight ErrorMsg ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE
highlight clear WarningMsg
highlight ErrorMsg ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE
highlight clear ModeMsg
highlight ModeMsg ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE

" question and more messages
highlight clear Question
highlight Question term=standout ctermfg=179 gui=bold guifg=#4E4E43
highlight clear MoreMsg
highlight MoreMsg term=bold cterm=bold ctermfg=179 gui=bold guifg=#4E4E43

" directories
highlight clear Directory
highlight Directory term=bold cterm=bold ctermfg=110 gui=bold guifg=#87AFD7

" whitespace
if !has('nvim')
  " vim uses hl-SpecialKey for nbsp, space, tab and trail
  highlight SpecialKey ctermfg=234 guifg=#F4F4F4
else
  " neovim uses hl-WhiteSpace for nbsp, space, tab and trail
  highlight WhiteSpace ctermfg=234 guifg=#F4F4F4
endif

" spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" don't distinguish between delete, add and change using bright colors,
" because:
"
" - add: appears opposite filler markers
" - delete: appears opposite filler markers
" - change: appears highlighted in changed portion of line
highlight DiffAdd ctermbg=0
highlight DiffDelete ctermbg=0
highlight DiffChange ctermbg=0

" use reverse foreground colors for +legibility (-consistency of color)
highlight DiffText cterm=reverse ctermbg=none

" end highlighting }}}

" listchars {{{

set list
call SetListCharsTabVisible()
call SetListCharsRemaining()

" end listchars }}}

" screen {{{

" turn off syntax coloring of long lines
set synmaxcol=200

" start parsing syntax 230 lines prior to current line
augroup syntaxsyncminlines
  autocmd!
  autocmd Syntax * syntax sync minlines=230
augroup END

" readjust window sizing
augroup autoresize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" fix background color bleed in tmux/screen
set t_ut=""

" end screen }}}

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
