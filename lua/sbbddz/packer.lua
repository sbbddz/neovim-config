local status, _ = pcall(require, "packer")

if not status then
	print("[ERROR] Packer is needed for this configuration to work")
	return
end

return require("packer").startup(function()
	--- Packer
	use("wbthomason/packer.nvim")

  --- Does this really speed nvim up?
  use 'lewis6991/impatient.nvim'

	--- Plenary
	use("nvim-lua/plenary.nvim")

	--- Fuzzy finder
	use("nvim-telescope/telescope.nvim")

	--- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	--- NVIM CMP
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind.nvim")

	--- IDE
	use("windwp/nvim-autopairs")
	use("mattn/emmet-vim")
	use("easymotion/vim-easymotion")
	use("sbdchd/neoformat")

	--- Appearance
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("glepnir/lspsaga.nvim")
	use("hoob3rt/lualine.nvim")
  -- thinking about posting a issue about this behaviour, while just use my fork
	use({
		"sbbddz/nvim-cokeline",
		requires = "kyazdani42/nvim-web-devicons", -- If you want devicons
	})

  --- Colorschemes
	-- use("catppuccin/nvim")
	-- use("folke/tokyonight.nvim")
	use("EdenEast/nightfox.nvim")
	-- use("ayu-theme/ayu-vim")
  use("tjdevries/colorbuddy.nvim")
  use("svrana/neosolarized.nvim")
  use("navarasu/onedark.nvim")


	--- Syntax Utilities
	use("lervag/vimtex")
end)
