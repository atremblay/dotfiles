" NOTES:
" The default binding for vim popup selection is <c-n> , <c-p> besides arrow key

"{{{ Plug
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
"Plug 'arcticicestudio/nord-vim', { 'on':  'NERDTreeToggle' }
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'ayu-theme/ayu-vim'
Plug 'AlessandroYorba/Alduin'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jacoborus/tender.vim'
Plug 'sjl/badwolf'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'edkolev/tmuxline.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Utils
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'janko/vim-test'
Plug 'tpope/vim-projectionist'
Plug 'puremourning/vimspector'
Plug 'tmhedberg/SimpylFold'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'

" LaTeX
Plug 'lervag/vimtex'
call plug#end()
"}}}

"{{{ Basic remapping
imap jk <Esc>
imap kj <Esc>
nmap <leader>a O<Esc>j
nmap <leader>b o<Esc>k

" Mapping to delete in the 'black hole' registry
nnoremap <leader>d "_d
xnoremap <leader>d "_d

if has('nvim')
    tnoremap jk <C-\><C-n>
    tnoremap kj <C-\><C-n>
endif
"}}}

"{{{ Theme stuff
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"let ayucolor="mirage"
"colorscheme ayu
"let g:airline_theme='ayu_mirage'
colorscheme gruvbox
let g:airline_theme='gruvbox'
"colorscheme iceberg
"let g:airline_theme='iceberg'
syntax enable
"let g:nord_cursor_line_number_background = 1
"let g:nord_italic_comments = 1
"}}}

"{{{ Splits and tabs
"{{{2 Split Navigation
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"}}}2
"{{{2 Change between tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
"}}}2
"{{{2 Adjust splits
noremap <silent> <Shift-Left> :vertical resize +3<CR>
noremap <silent> <Shift-Right> :vertical resize -3<CR>
noremap <silent> <Shift-Up> :resize +3<CR>
noremap <silent> <Shift-Down> :resize +3<CR>
"}}}2
"{{{2 Switch split orientation
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
"}}}2
"}}}

"{{{1 Plugin Config
"{{{2 Coc 
set updatetime=300
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <C-F6> <Plug>(coc-rename)

let g:coc_global_extensions = [
    \"coc-python",
    \"coc-json",
    \"coc-html",
    \"coc-css",
    \"coc-snippets",
    \"coc-git"
\]

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"}}}2

"{{{2 UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDir=$HOME."/.config/nvim/my_snippets"
let g:UltiSnipsSnippetDirectories=["my_snippets", "UltiSnips"]
let g:UltiSnipsUsePythonVersion = 3
"}}}2

"{{{2 Vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#python#pytest#options = '--tb=short --durations=10 --fast'
"}}}2

"{{{ 2 NERDTree
map <F2> :NERDTreeToggle<CR>
"}}}2

"{{{2 FZF
"nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :<C-u>FzfPreviewDirectoryFiles<CR>
nnoremap <C-b> :Buffers<CR>
"}}}2

"{{{2 Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
"}}}2

"{{{2 airline
let g:airline_section_b=''
"}}}2

"{{{2 Vimwiki
let g:vimwiki_list = [
    \{'path':'~/vimwiki/friday', 'syntax': 'markdown', 'ext': '.md'},
    \{'path':'~/vimwiki/explorance', 'syntax': 'markdown', 'ext': '.md'},
    \{'path':'~/vimwiki/personal', 'syntax': 'markdown', 'ext': '.md'}
\]
:nmap <Leader>w <Plug>VimwikiIndex
"}}}2

"{{{2 Vimtext
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"}}}2
"}}}1

"{{{ Neovim settings
" Folding
set foldmethod=marker

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
    \ set textwidth=0 |
    \ set autoindent |
    \ set expandtab |
    \ set fileformat=unix

" Remove trailing white space in python files
autocmd BufWritePre *.py :%s/\s\+$//e
let g:python3_host_prog = $HOME."/miniconda3/envs/neovim/bin/python"

" stop highlighting search
set nohlsearch

filetype plugin on
"}}}

