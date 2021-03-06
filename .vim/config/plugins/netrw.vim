" suppress banner
let g:netrw_banner = 0

" don't generate .netrwhist files
let g:netrw_dirhistmax = 0

" don't allow netrw to map gx for opener handling
let g:netrw_nogx = 1

" do network file transfers silently
let g:netrw_silent = 1

" use tree view
let g:netrw_liststyle = 3

" decrease default window size
let g:netrw_winsize = '30'

" open files in new vertical split
let g:netrw_browse_split = 2

" disable buffer reuse to reduce netrw bugs
let g:netrw_fastbrowse = 0

function s:HighlightNetrw() abort
  " make symlink highlighting bearable on tty
  highlight clear netrwSymlink
  highlight default link netrwSymlink Special
endfunction

augroup highlight
  autocmd!
  autocmd ColorScheme * call <SID>HighlightNetrw()
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
