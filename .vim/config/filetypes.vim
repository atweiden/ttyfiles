augroup languages
  autocmd!

  " elixir
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-elixir',
      \ join([
      \   '*.ex',
      \   '*.exs',
      \   'mix.lock',
      \   '*.eex',
      \   '*.leex'
      \ ], ','))
  autocmd FileType elixir packadd vim-elixir

  " enc
  autocmd BufNewFile,BufRead *.enc setlocal filetype=enc
  execute printf('autocmd BufReadPre,FileReadPre *.enc setlocal %s',
      \ join([
      \   'viminfo=',
      \   'nobackup',
      \   'noswapfile',
      \   'noundofile',
      \   'nowritebackup',
      \   'noshelltemp',
      \   'history=0',
      \   'cryptmethod=blowfish2'
      \ ], ' '))

  " fennel
  autocmd BufReadPre,FileReadPre *.fnl packadd vim-fennel
  autocmd FileType fennel packadd vim-fennel

  " finn
  autocmd BufReadPre,FileReadPre *.finn packadd vim-finn
  autocmd FileType finn packadd vim-finn

  " gpg
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')

  " janet
  autocmd BufReadPre,FileReadPre *.janet packadd janet.vim
  autocmd FileType janet packadd janet.vim

  " journal
  autocmd BufReadPre,FileReadPre *.txt packadd vim-journal
  autocmd FileType journal packadd vim-journal

  " raku
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-raku',
      \ join([
      \   '*.raku',
      \   '*.rakumod',
      \   '*.rakudoc',
      \   '*.rakutest',
      \   '*.pm6',
      \   '*.p6',
      \   '*.pl6',
      \   '*.t6',
      \   '*.t',
      \   '*.nqp'
      \ ], ','))
  autocmd FileType raku packadd vim-raku

  " toml
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-toml',
      \ join([
      \   '*.toml',
      \   'Gopkg.lock',
      \   'Cargo.lock'
      \ ], ','))
  autocmd FileType toml packadd vim-toml

  " txn
  autocmd BufNewFile,BufRead *.txn setlocal filetype=txn

  " xbps
  autocmd BufReadCmd *.xbps call tar#Browse(expand("<amatch>"))
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
