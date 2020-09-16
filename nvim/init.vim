" NOTES:
" The default binding for vim popup selection is <c-n> , <c-p> besides arrow key

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/vimtest.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim
source $HOME/.config/nvim/plug-config/which-key.vim

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

"{{{1 Theme stuff
if exists('+termguicolors')
  "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
syntax enable

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Go in that config file to change the theme
source $HOME/.config/nvim/themes/themes.vim
"}}}1

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
noremap <silent> <M-S-k> :vertical resize +3<CR>
noremap <silent> <M-S-j> :vertical resize -3<CR>
noremap <silent> <M-S-h> :resize +3<CR>
noremap <silent> <M-S-l> :resize +3<CR>
"}}}2
"{{{2 Switch split orientation
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
"}}}2
"}}}

"{{{1 Plugin Config

map <F2> :NERDTreeToggle<CR>

"let g:vimspector_enable_mappings = 'HUMAN'

let g:airline_section_b=''

let g:vimwiki_list = [
    \{'path':'~/vimwiki/friday', 'syntax': 'markdown', 'ext': '.md'},
    \{'path':'~/vimwiki/explorance', 'syntax': 'markdown', 'ext': '.md'},
    \{'path':'~/vimwiki/personal', 'syntax': 'markdown', 'ext': '.md'}
\]
:nmap <Leader>w <Plug>VimwikiIndex

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

