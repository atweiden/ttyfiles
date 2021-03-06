" Credit: https://github.com/junegunn/dotfiles

" facilitate lazy loading
augroup loadtbone
  autocmd!
  autocmd User LoadTbone ++once packadd vim-tbone
augroup END

function! s:LoadTboneCompletePanes(...) abort
  silent doautocmd User LoadTbone
  return tbone#complete_panes(a:000)
endfunction

function! s:TmuxSend(...) range abort
  silent doautocmd User LoadTbone
  let l:dest = get(a:, 1, '')
  if empty(l:dest)
    call inputsave()
    let l:dest = input('To which pane? ')
    call inputrestore()
  endif
  silent call tbone#write_command(0, a:firstline, a:lastline, 1, l:dest)
endfunction

command! -nargs=? -range -complete=custom,<SID>LoadTboneCompletePanes TmuxSend <line1>,<line2>call <SID>TmuxSend(<f-args>)

for m in ['n', 'x']
  let gv = m == 'x' ? 'gv' : ''
  execute m . "noremap <silent> <leader>tt :call <SID>TmuxSend('')<CR>" . gv
  execute m . "noremap <silent> <leader>th :call <SID>TmuxSend('.left')<CR>" . gv
  execute m . "noremap <silent> <leader>tj :call <SID>TmuxSend('.bottom')<CR>" . gv
  execute m . "noremap <silent> <leader>tk :call <SID>TmuxSend('.top')<CR>" . gv
  execute m . "noremap <silent> <leader>tl :call <SID>TmuxSend('.right')<CR>" . gv
  execute m . "noremap <silent> <leader>ty :call <SID>TmuxSend('.top-left')<CR>" . gv
  execute m . "noremap <silent> <leader>to :call <SID>TmuxSend('.top-right')<CR>" . gv
  execute m . "noremap <silent> <leader>tn :call <SID>TmuxSend('.bottom-left')<CR>" . gv
  execute m . "noremap <silent> <leader>t. :call <SID>TmuxSend('.bottom-right')<CR>" . gv
endfor

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
