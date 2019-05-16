
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'alpertuna/vim-header'

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
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" Let deoplete jedi do the completion
let g:jedi#completions_enabled = 0

"if (has("termguicolors"))
set termguicolors
"endif

"let ayucolor="dark"
let ayucolor="mirage"
colorscheme ayu
syntax enable
"colorscheme OceanicNext
let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1
"colorscheme nord
let g:airline_theme='ayu'

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change between tabs
nnoremap <A-Left> :tabprevious<CR>                                                                            
nnoremap <A-Right> :tabnext<CR>

let g:deoplete#auto_complete=1
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100

" Indentation
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

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
    \ set wrapmargin=79 |
    "\ set textwidth=79 |
    \ set autoindent |
    \ set expandtab |
    \ set fileformat=unix

map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Remove trailing white space in python files
autocmd BufWritePre *.py :%s/\s\+$//e
let g:python3_host_prog = '~/miniconda3/envs/neovim/bin/python'

"let g:UltiSnipsUsePythonVersion = 3

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

