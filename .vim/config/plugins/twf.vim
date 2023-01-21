vim9script

def Twf(): void
  var temp = tempname()
  execute 'silent ! twf ' .. @% .. ' > ' .. temp
  redraw!
  var out = []
  try
    if filereadable(temp)
      out = readfile(temp)
    endif
  finally
    silent! delete(temp)
  endtry
  if !empty(out)
    execute 'edit! ' .. out[0]
  endif
enddef

command! Twf Twf()

def TwfChooser(dirname: string): void
  if isdirectory(dirname)
    Twf()
  endif
enddef

augroup twf
  autocmd!
  autocmd BufEnter * silent TwfChooser(expand("<amatch>"))
augroup END

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
