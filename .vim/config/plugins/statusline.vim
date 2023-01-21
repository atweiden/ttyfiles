vim9script

# clear statusline
set statusline=

# truncate line here
set statusline+=%<

# mode with leading whitespace offset to mimic lightline.vim
set statusline+=%{'\ \ '}
set statusline+=%{home#statusline#VimMode()}
set statusline+=%{'\ \ │\ '}

# paste mode
set statusline+=%{home#statusline#PasteMode()}

# git branch
set statusline+=%{home#statusline#GitBranchName()}

# read only
set statusline+=%{home#statusline#ReadOnly()}

# file path, as typed or relative to current directory
set statusline+=%t

# modified
set statusline+=%{home#statusline#Modified()}

# separation point between left and right aligned items
set statusline+=%=

# file format
set statusline+=%{&fileformat}
set statusline+=%{'\ \ │\ '}

# file encoding
set statusline+=%{&fileencoding}
set statusline+=%{'\ \ │\ '}

# file type
set statusline+=%{home#statusline#FileType()}
set statusline+=%{'\ \ │\ '}

# scrollthrough percentage
set statusline+=%2p%%
set statusline+=%{'\ │\ '}

# line number
set statusline+=%{home#statusline#LineNumber()}
set statusline+=%{':'}

# virtual column number
set statusline+=%-2v

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
