vim9script

# keep synced with gomod.vim

# don't install go binaries on startup
g:go_disable_autoinstall = 1

# disable gopls
g:go_gopls_enabled = 0

# use gofmt for :GoFmt
g:go_fmt_command = 'gofmt'

# use guru for :GoInfo
g:go_info_mode = 'guru'

# use goimports for :GoImports
g:go_imports_mode = 'goimports'

# use guru for :GoDef
g:go_def_mode = 'guru'

# use fillstruct for :GoFillStruct
g:go_fillstruct_mode = 'fillstruct'

# use guru for :GoReferrers
g:go_referrers_mode = 'guru'

# use guru for :GoImplements
g:go_implements_mode = 'guru'

# use golangci-lint for :GoMetaLinter
g:go_metalinter_command = 'golangci-lint'

# use gorename for :GoRename
g:go_rename_command = 'gorename'

# use fzf for :GoDecls
g:go_decls_mode = 'fzf'

# disable auto :GoFmt on save
g:go_fmt_autosave = 0

# disable auto :GoModFmt on save
g:go_mod_fmt_autosave = 0

# disable auto :GoImports on save
g:go_imports_autosave = 0

# disable auto :GoMetaLinter on save
g:go_metalinter_autosave = 0

# disable auto :AsmFmt on save
g:go_asmfmt_autosave = 0

# don't show location list when :GoFmt fails
#g:go_fmt_fail_silently = 1

# disable default mapping (`gd`) for :GoDef
g:go_def_mapping_enabled = 0

# disable default mapping (`K`) for :GoDoc
g:go_doc_keywordprg_enabled = 0

# display quickfix window instead of popup on :GoDoc
g:go_doc_popup_window = 0

# reduce time statusline message is shown to 15 seconds
g:go_statusline_duration = 15000

# disable highlighting trailing whitespace
g:go_highlight_trailing_whitespace_error = 0

# disable highlighting whitespace after `[]`
g:go_highlight_array_whitespace_error = 0

# disable highlighting whitespace around communications operator (`<-`)
# if not in standard style
g:go_highlight_chan_whitespace_error = 0

# disable highlighting instances of tabs following spaces
g:go_highlight_space_tab_error = 0

# disable highlighting spelling errors in strings when spell is also enabled
g:go_highlight_string_spellcheck = 0

# highlight operators such as `:=` , `==`, `-=`, etc
g:go_highlight_operators = 1

# disable highlighting variable declarations (`:=`)
g:go_highlight_variable_declarations = 0

# disable highlighting variable assignments (`=`)
g:go_highlight_variable_assignments = 0

# highlight function and method declarations
g:go_highlight_functions = 1

# disable highlighting function and method calls
g:go_highlight_function_calls = 0

# highlight struct and interface names
g:go_highlight_types = 1

# highlight field names
g:go_highlight_fields = 1

# highlight build constraints
g:go_highlight_build_constraints = 1

# highlight go:generate directives
g:go_highlight_generate_tags = 1

# highlight printf-style operators inside string literals
g:go_highlight_format_strings = 1

# enable folding of { .. }, import, var and const blocks
g:go_fold_enable = ['block', 'import', 'varconst']

# disable pre-filling new go buffers
g:go_template_autocreate = 0

# open new terminal in horizontal split
g:go_term_mode = 'split'

# don't open browser after posting snippet with :GoPlay
g:go_play_open_browser = 0

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
