" clear cursor styles
set guicursor=

" disable error noises
set belloff=all
set noerrorbells
set vb t_vb=

" insert N pixel lines between characters
set linespace=1

" number of screen lines around cursor
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

" show the line number in front of each line
set number

" show relative line numbers
set relativenumber

" minimum number of columns to use for the line number
set numberwidth=1

" indicate wrapped characters
set showbreak=ø

" don't highlight screen line or column
set nocursorcolumn
set nocursorline

" limit command line messages
set shortmess=acFIoO
"             ||||||
"             |||||+--- Overview previous message when reading file
"             ||||+---- Omit redundant messages
"             |||+----- Don't show intro message when starting vim
"             ||+------ Don't show filename in command line bar
"             |+------- Don't show |ins-completion-menu| messages
"             +-------- Abbreviate messages without loss of information

" don't show status line
set laststatus=0

" don't show active mode on last line, status line has this covered
set noshowmode

" don't show line/column number absent status line
set noruler

" don't highlight matching parens
set noshowmatch

" highlight search pattern matches
set hlsearch

" show search pattern matches during pattern entry
set incsearch

" allow no height, no width windows
set winminheight=0
set winminwidth=0

" lower maximum height of popup menu
set pumheight=20

" make help window more likely to open at half existing window height
set helpheight=12

" highlighting {{{

function! Highlight() abort
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
  " vim uses hl-SpecialKey for nbsp, space, tab and trail
  highlight clear SpecialKey
  highlight default link SpecialKey NonText
  " neovim uses hl-WhiteSpace for nbsp, space, tab and trail
  highlight clear WhiteSpace
  highlight default link Whitespace NonText

  " spelling
  highlight clear SpellBad
  highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
  highlight clear SpellCap
  highlight SpellCap term=underline cterm=underline
  highlight clear SpellRare
  highlight SpellRare term=underline cterm=underline
  highlight clear SpellLocal
  highlight SpellLocal term=underline cterm=underline

  " diff text
  highlight clear DiffAdd
  highlight link DiffAdd GitGutterAdd
  highlight clear DiffChange
  highlight link DiffChange GitGutterText
  highlight clear DiffDelete
  highlight link DiffDelete GitGutterDelete
  highlight clear DiffText
  highlight link DiffText GitGutterChange
endfunction

augroup highlight
  autocmd!
  autocmd ColorScheme * call Highlight()
augroup END

" turn off any existing search
augroup searchhighlight
  autocmd!
  autocmd VimEnter * nohlsearch
augroup END

" conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" colorscheme
set t_Co=16
set background=dark
let g:seoul256_background = 233
let g:seoul256_light_background = 256
silent! colorscheme seoul256

" end highlighting }}}
" neovim {{{

if has('nvim')
  " set :terminal cursor to URxvt-like underline
  highlight clear TermCursor
  highlight TermCursor ctermfg=red cterm=underline gui=underline
  highlight clear TermCursorNC
  highlight TermCursorNC ctermfg=red cterm=underline gui=underline
  " enable substitution live preview
  set inccommand=nosplit
endif

" end neovim }}}
" listchars {{{

set list
execute 'set listchars=tab:¦\ '
set listchars+=nbsp:·
set listchars+=extends:›
set listchars+=precedes:‹

" end listchars }}}
" screen {{{

" turn off syntax coloring of long lines
set synmaxcol=200

" start parsing syntax 75 lines prior to current line
augroup syntaxsyncminlines
  autocmd!
  autocmd Syntax * syntax sync minlines=75
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
