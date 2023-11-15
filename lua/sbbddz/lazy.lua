-- [[ LAZY ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	--- [[  MISCELLANEA  ]]
	{ "willothy/flatten.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	--- [[  LSP  ]]
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	--- [[  IDE  ]]
	{ "windwp/nvim-autopairs" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "mhartington/formatter.nvim" },
	{ "mfussenegger/nvim-dap" },
	--- [[  APPEARANCE  ]]
	{ "Shatur/neovim-ayu" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "rebelot/kanagawa.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	--- [[  OTHER LANGUAGES  ]]
	{ "lervag/vimtex" },
	{ "Hoffs/omnisharp-extended-lsp.nvim" },
}, {
	ui = {
		size = {
			height = 0.6,
		},
		icons = nil,
		border = "single",
	},
})
