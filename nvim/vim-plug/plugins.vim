" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-compe'
Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', {'branch': 'main'}
Plug 'anott03/nvim-lspinstall'

" theme
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'aditya-azad/candle-grey'
Plug 'chuling/equinusocio-material.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'chuling/ci_dark'
Plug 'luochen1990/rainbow'
Plug 'habamax/vim-gruvbit'
Plug 'sainnhe/edge'
Plug 'kyazdani42/blue-moon'
Plug 'sainnhe/sonokai'

" Git
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" Utils
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'janko/vim-test'
Plug 'tpope/vim-projectionist'
Plug 'puremourning/vimspector'
Plug 'tmhedberg/SimpylFold'
"Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'airblade/vim-rooter'

" LaTeX
Plug 'lervag/vimtex'


" testing these out
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}

Plug 's1n7ax/nvim-comment-frame', {'branch': 'main'}
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
