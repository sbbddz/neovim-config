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
	{ "willothy/flatten.nvim", opts = {} }, -- Opens files from vim terminal inside current vim session
	{ "nvim-lua/plenary.nvim" }, -- Required for telescope, lua utils functions
	{ "nvim-telescope/telescope.nvim" }, -- Fzf but its better
	--- [[  LSP  ]]
	{ "williamboman/mason.nvim" }, --
	{ "williamboman/mason-lspconfig.nvim" }, -- This two plugins makes working with lsp really nice
	{ "neovim/nvim-lspconfig" }, -- LSP config
	{ "hrsh7th/cmp-nvim-lsp" }, --
	{ "hrsh7th/cmp-buffer" }, --
	{ "hrsh7th/cmp-path" }, --
	{ "hrsh7th/cmp-cmdline" }, --
	{ "hrsh7th/nvim-cmp" }, -- NVIM cmp, makes nvim completion feel really great
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } }, --
	{ "saadparwaiz1/cmp_luasnip" }, --
	--- [[  IDE  ]]
	{ "windwp/nvim-autopairs", opts = {} }, -- Auto close parens and brackets
	{ "nvim-treesitter/nvim-treesitter" }, -- Really nice syntax, identation, an other things per language
	{ "mhartington/formatter.nvim" }, -- I don't know how to work with lsp formatters, so this works OK
	{ "mfussenegger/nvim-dap" }, -- For debugging, I don't use it too much, only with dotnet
	{ "tpope/vim-sleuth" }, -- Stop worrying about tabs, spaces, etc
	--- [[  APPEARANCE  ]]
	{ "kyazdani42/nvim-web-devicons" }, -- I like to see nice icons in telescope
	{ "rebelot/kanagawa.nvim" }, -- I really like this colorscheme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- This is a very nice colorscheme alse
	--- [[  OTHER LANGUAGES  ]]
	{ "Hoffs/omnisharp-extended-lsp.nvim" }, -- I want to see the definition and implementation of decompiled sources in c#
}, {
	ui = {
		size = {
			height = 0.6,
		},
		icons = nil,
		border = "single",
	},
})
