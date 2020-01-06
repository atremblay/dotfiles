" NOTES:
" The default binding for vim popup selection is <c-n> , <c-p> besides arrow key

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'arcticicestudio/nord-vim', { 'on':  'NERDTreeToggle' }
Plug 'ayu-theme/ayu-vim'
Plug 'nanotech/jellybeans.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Utils
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" LaTeX
Plug 'lervag/vimtex'
call plug#end()


" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDir=$HOME."/.config/nvim/my_snippets"
let g:UltiSnipsSnippetDirectories=["my_snippets", "UltiSnips"]
let g:UltiSnipsUsePythonVersion = 3

" Basic remaping
imap jk <Esc>
imap kj <Esc>
nmap <leader>a O<Esc>j
nmap <leader>b o<Esc>k

"if (has("termguicolors"))
set termguicolors
"endif

"""""""""""""""
" Theme stuff "
"""""""""""""""
let ayucolor="dark"
colorscheme ayu
syntax enable
let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1
let g:airline_theme='ayu_dark'

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change between tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" NERDTreeToggle
map <F2> :NERDTreeToggle<CR>

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


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" stop highlighting search
set nohlsearch

"let g:jedi#max_doc_height = 75

nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-b> :Buffers<CR>

""""""""""""""
" coc config "
""""""""""""""
set updatetime=300
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <F6> <Plug>(coc-rename)

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
