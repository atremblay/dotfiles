" NOTES:
" The default binding for vim popup selection is <c-n> , <c-p> besides arrow key

call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim', { 'on':  'NERDTreeToggle' }
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" expanding abbreviations
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Linting https://github.com/neomake/neomake
Plug 'neomake/neomake'

" Utils
Plug 'tpope/vim-surround'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'tmhedberg/SimpylFold'

" Multicursor like sublime text
Plug 'terryma/vim-multiple-cursors'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Linting
Plug 'w0rp/ale'

" LaTeX
Plug 'lervag/vimtex'

"Plug 'kiteco/vim-plugin'
call plug#end()

" Let deoplete jedi do the completion
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#auto_complete=1
let g:deoplete#auto_complete_delay = 100

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDir=$HOME."/.config/nvim/my_snippets"
let g:UltiSnipsSnippetDirectories=["my_snippets", "UltiSnips"]
let g:UltiSnipsUsePythonVersion = 3

imap jk <Esc>
imap kj <Esc>

"if (has("termguicolors"))
set termguicolors
"endif

let ayucolor="mirage"
colorscheme ayu
syntax enable
"colorscheme OceanicNext
let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1
"colorscheme nord
let g:airline_theme='ayu_mirage'
"let g:airline_theme='nord'

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change between tabs
nnoremap <A-Left> :tabprevious<CR>                                                                            
nnoremap <A-Right> :tabnext<CR>

" Indentation
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Case sensitive search if there are any uppercase
" Case insensitive if search term is all lower case
set smartcase

" number in gutter
set nu
" relative number in gutter
set rnu
" Stay X lines from top or bottom
set scrolloff=10

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    "\ set wrapmargin=79 |
    \ set textwidth=0 |
    \ set autoindent |
    \ set expandtab |
    \ set fileformat=unix

map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Remove trailing white space in python files
autocmd BufWritePre *.py :%s/\s\+$//e
let g:python3_host_prog = expand("$HOME/miniconda3/envs/neovim/bin/python")


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


let g:header_field_author = 'Alexis Tremblay'
let g:header_field_author_email = 'atremblay@explorance.com'
let g:header_field_timestamp = 1
map <F4> :AddHeader<CR>

" stop highlighting search
set nohlsearch

"let g:jedi#max_doc_height = 75

nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-b> :Buffers<CR>

" ALE config
let g:ale_linters = {'python': ['pylint']}
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 1

" vimtex config
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=1
set conceallevel=1
let g:tex_conceal='abdmg'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
"if has('conceal')
  "set conceallevel=2 concealcursor=niv
"endif
