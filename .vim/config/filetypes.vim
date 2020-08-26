augroup languages
  autocmd!

  " elixir
  autocmd BufNewFile,BufRead *.ex,*.exs,mix.lock,*.eex,*.leex packadd vim-elixir

  " enc
  autocmd BufNewFile,BufRead *.enc setlocal filetype=enc
  autocmd BufReadPre,FileReadPre *.enc setlocal viminfo= nobackup noswapfile noundofile

  " gpg
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')

  " txn
  autocmd BufNewFile,BufRead *.txn setlocal filetype=txn

  " xbps
  autocmd BufReadCmd *.xbps call tar#Browse(expand("<amatch>"))
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
