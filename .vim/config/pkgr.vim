function! PkgrSetup() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  " windows
  call packager#add('talek/obvious-resize')

  " folds
  call packager#add('Konfekt/FastFold')
  call packager#add('Harenome/vim-neatfoldtext')

  " keyboard
  call packager#add('kana/vim-arpeggio', { 'type': 'opt' })
  call packager#add('drmikehenry/vim-fixkey')

  " search and replace
  call packager#add('junegunn/fzf')
  call packager#add('junegunn/fzf.vim')

  " movement
  call packager#add('rhysd/clever-f.vim')
  call packager#add('christoomey/vim-tmux-navigator')

  " repeat
  call packager#add('tpope/vim-repeat')

  " undo
  call packager#add('mbbill/undotree', { 'type': 'opt' })

  " surround
  call packager#add('tpope/vim-surround')

  " comments
  call packager#add('tpope/vim-commentary')

  " modelines
  call packager#add('ciaranm/securemodelines')

  " align
  call packager#add('tommcdo/vim-lion', { 'type': 'opt' })
  call packager#add('t9md/vim-textmanip', { 'type': 'opt' })

  " narrow region
  call packager#add('atweiden/vim-viewport', { 'type': 'opt' })

  " command runners
  call packager#add('tpope/vim-tbone')

  " languages {{{

  " --- elixir {{{

  call packager#add('elixir-editors/vim-elixir')

  " --- end elixir }}}
  " --- journal {{{

  call packager#add('junegunn/vim-journal')
  call packager#add('atweiden/vim-finn', { 'branch': 'finn' })

  " --- end journal }}}
  " --- lisp {{{

  call packager#add('atweiden/vim-fennel')
  call packager#add('janet-lang/janet.vim')

  " --- end lisp }}}
  " --- raku {{{

  call packager#add('Raku/vim-raku')

  " --- end raku }}}
  " --- toml {{{

  call packager#add('cespare/vim-toml')

  " --- end toml }}}

  " end languages }}}

  " colors
  call packager#add('noahfrederick/vim-noctu')
  call packager#add('atweiden/seoul256.vim', { 'branch': 'fix-todo-hi' })

  " color utilities
  call packager#add('ntpeters/vim-better-whitespace')
  call packager#add('mhinz/vim-hugefile')
  call packager#add('junegunn/rainbow_parentheses.vim', { 'type': 'opt' })
endfunction

command! PkgrSetup call PkgrSetup()
command! PkgrInstall call PkgrSetup() | call packager#install()
command! -bang PkgrUpdate call PkgrSetup() | call packager#update({ 'force_hooks': '<bang>' })
command! PkgrClean call PkgrSetup() | call packager#clean()
command! PkgrStatus call PkgrSetup() | call packager#status()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
