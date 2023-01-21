vim9script

export def FileType(): string
  return &filetype !=# '' ? &filetype : 'no ft'
enddef

export def GitBranchName(): string
  var git_branch_name = gitbranch#name()
  return git_branch_name !=# '' ? git_branch_name .. ' │ ' : ''
enddef

export def LineNumber(): string
  return printf('%3d', line('.'))
enddef

export def Modified(): string
  return &modified ? ' +' : ''
enddef

export def PasteMode(): string
  return &paste ? 'PASTE │ ' : ''
enddef

export def ReadOnly(): string
  return &readonly ? '© ' : ''
enddef

export def VimMode(): string
  const vim_mode_map = { 'n': 'NORMAL',
                         'i': 'INSERT',
                         'R': 'REPLACE',
                         'v': 'VISUAL',
                         'V': 'V-LINE',
                         "\<C-v>": 'V-BLOCK',
                         'c': 'COMMAND',
                         's': 'SELECT',
                         'S': 'S-LINE',
                         "\<C-s>": 'S-BLOCK',
                         't': 'TERMINAL' }
  return get(vim_mode_map, mode(), '[no mode]')
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
