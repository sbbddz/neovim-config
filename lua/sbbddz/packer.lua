local status, _ = pcall(require, "packer")

if not status then
	print("[ERROR] Packer is needed for this configuration to work")
	return
end

return require("packer").startup(function()
	--- Packer
	use("wbthomason/packer.nvim")

	-- Plenary
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
	use("ayu-theme/ayu-vim")
	use("folke/tokyonight.nvim")
	use("hoob3rt/lualine.nvim")

	--- Syntax Utilities
	use("lervag/vimtex")

	--- Last to load
	use("ryanoasis/vim-devicons")
end)
