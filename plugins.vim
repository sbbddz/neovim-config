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
    Plug 'easymotion/vim-easymotion'
    Plug 'sbdchd/neoformat'

  """ Appearance
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'morhetz/gruvbox'
    Plug 'ayu-theme/ayu-vim'
    Plug 'joshdick/onedark.vim'

  """ Syntax Utilities 
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'lervag/vimtex'

  """ Last to load
    Plug 'ryanoasis/vim-devicons'
call plug#end()
