function! s:Twf() abort
  let temp = tempname()
  execute 'silent ! twf ' . @% . ' > ' . temp
  redraw!
  try
    let out = filereadable(temp) ? readfile(temp) : []
  finally
    silent! call delete(temp)
  endtry
  if !empty(out)
    execute 'edit! ' . out[0]
  endif
endfunction

command! Twf call Twf()

function! s:TwfChooser(dirname) abort
  if isdirectory(a:dirname)
    call Twf()
  endif
endfunction

augroup twf
  autocmd!
  autocmd BufEnter * silent call <SID>TwfChooser(expand("<amatch>"))
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
