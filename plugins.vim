call plug#begin('~/.vim/plugged')
""" Fuzzy finder
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim'

""" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'williamboman/nvim-lsp-installer'
Plug 'halkn/lightline-lsp'

""" IDE
Plug 'windwp/nvim-autopairs'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'

""" Appearance
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

""" Syntax Utilities 
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
