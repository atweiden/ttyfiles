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
  call packager#add('junegunn/fzf', { 'type': 'opt' })
  call packager#add('junegunn/fzf.vim', { 'type': 'opt' })

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

  call packager#add('elixir-editors/vim-elixir', { 'type': 'opt' })

  " --- end elixir }}}
  " --- journal {{{

  call packager#add('junegunn/vim-journal', { 'type': 'opt' })
  call packager#add('atweiden/vim-finn', { 'branch': 'finn',
                                         \   'type': 'opt' })

  " --- end journal }}}
  " --- lisp {{{

  call packager#add('atweiden/vim-fennel', { 'type': 'opt' })
  call packager#add('janet-lang/janet.vim', { 'type': 'opt' })

  " --- end lisp }}}
  " --- raku {{{

  call packager#add('Raku/vim-raku', { 'type': 'opt' })

  " --- end raku }}}
  " --- toml {{{

  call packager#add('cespare/vim-toml', { 'type': 'opt' })

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

function! PkgrStow(plugin_name) abort
  call PkgrSetup()
  let l:dir_pkgr = $VIMPATH . '/pack/packager'
  let l:dir_stow = l:dir_pkgr . '/stow'
  let l:dir_src = packager#plugin(a:plugin_name).dir
  let l:dir_dst = l:dir_stow . '/' . a:plugin_name
  if !isdirectory(l:dir_stow)
    call mkdir(l:dir_stow, "p")
  endif
  execute printf('call system("mv %s %s")', l:dir_src, l:dir_dst)
endfunction

function! PkgrUnstow(plugin_name) abort
  call PkgrSetup()
  let l:dir_pkgr = $VIMPATH . '/pack/packager'
  let l:dir_stow = l:dir_pkgr . '/stow'
  let l:dir_src = l:dir_stow . '/' . a:plugin_name
  let l:dir_dst = packager#plugin(a:plugin_name).dir
  execute printf('call system("mv %s %s")', l:dir_src, l:dir_dst)
endfunction

command! PkgrSetup call PkgrSetup()
command! PkgrInstall call PkgrSetup() | call packager#install()
command! -bang PkgrUpdate call PkgrSetup() | call packager#update({ 'force_hooks': '<bang>' })
command! PkgrClean call PkgrSetup() | call packager#clean()
command! PkgrStatus call PkgrSetup() | call packager#status()

" stow uncooperative plugins as an elaborate form of lazy loading
command! -nargs=1 PkgrStow call PkgrStow(<f-args>)
command! -nargs=1 PkgrUnstow call PkgrUnstow(<f-args>)

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
