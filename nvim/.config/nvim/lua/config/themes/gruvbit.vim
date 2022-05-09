
func! s:gruvbit_setup() abort
    hi Comment gui=italic cterm=italic
    hi Statement gui=bold cterm=bold
endfunc

augroup colorscheme_change | au!
    au ColorScheme gruvbit call s:gruvbit_setup()
augroup END

set termguicolors
colorscheme gruvbit
