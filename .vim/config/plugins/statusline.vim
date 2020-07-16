let s:vim_mode_map = {
    \ 'n': 'NORMAL',
    \ 'i': 'INSERT',
    \ 'R': 'REPLACE',
    \ 'v': 'VISUAL',
    \ 'V': 'V-LINE',
    \ "\<C-v>": 'V-BLOCK',
    \ 'c': 'COMMAND',
    \ 's': 'SELECT',
    \ 'S': 'S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ 't': 'TERMINAL'
    \ }

function! GitBranch() abort
  if !exists('b:git_branch')
    let b:git_branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endif
  return b:git_branch
endfunction

" refresh git branch periodically
augroup gitbranch
  autocmd!
  autocmd BufEnter,BufWritePost,CursorHold,CursorHoldI,FocusGained <buffer>
    \ silent! unlet b:git_branch
augroup END

function! VimMode() abort
  return get(s:vim_mode_map, mode(), '[no mode]')
endfunction

" clear statusline
set statusline=

" truncate line here
set statusline+=%<

" mode with leading whitespace offset to mimic lightline.vim
set statusline+=%{'\ \ '}
set statusline+=%{VimMode()}
set statusline+=%{'\ \ │\ '}

" paste mode
set statusline+=%{&paste?'PASTE\ │\ ':''}

" git branch
set statusline+=%{GitBranch()!=#''?'¥\ '.GitBranch().'\ │\ ':''}

" read only
set statusline+=%{&readonly?'©\ ':''}

" file path, as typed or relative to current directory
set statusline+=%f

" modified
set statusline+=%{&modified?'\ +':''}

" separation point between left and right aligned items
set statusline+=%=

" file format
set statusline+=%{&fileformat}
set statusline+=%{'\ \ │\ '}

" file encoding
set statusline+=%{&fileencoding}
set statusline+=%{'\ \ │\ '}

" file type
set statusline+=%{&filetype!=#''?&filetype:'no\ ft'}
set statusline+=%{'\ \ │\ '}

" scrollthrough percentage
set statusline+=%2p%%
set statusline+=%{'\ │\ '}

" line number
set statusline+=%{&number?printf('%3d',line('.')):''}
set statusline+=%{':'}

" virtual column number
set statusline+=%-2v

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
