local status, _ = pcall(require, "packer")

if not status then
	print("[ERROR] Packer is needed for this configuration to work")
	return
end

return require("packer").startup(function()
	--- [[  MISCELLANEA  ]]
	use("wbthomason/packer.nvim")
	use("willothy/flatten.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	--- [[  LSP  ]]
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	--- [[  IDE  ]]
	use("windwp/nvim-autopairs")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("mhartington/formatter.nvim")

	--- [[  BUFFERLINE  ]]
	use({
		"sbbddz/nvim-cokeline",
		requires = "kyazdani42/nvim-web-devicons", -- If you want devicons
	})

	--- [[  COLORSCHEMES  ]]
	use("EdenEast/nightfox.nvim")
	use("Shatur/neovim-ayu")

	--- [[  OTHER LANGUAGES  ]]
	use("lervag/vimtex")
	use("Hoffs/omnisharp-extended-lsp.nvim")
end)
