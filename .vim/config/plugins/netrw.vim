" suppress the banner
let g:netrw_banner = 0

" do network file transfers silently
let g:netrw_silent = 1

" use tree view
let g:netrw_liststyle = 3

" smaller default window size
let g:netrw_winsize = '30'

" open files in new vertical split
let g:netrw_browse_split = 2

" make symlink highlighting bearable on tty
highlight clear netrwSymlink
highlight link netrwSymlink Special

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
