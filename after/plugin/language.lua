-- Setup nvim-cmp
local status, cmp = pcall(require, "cmp")

if not status then
	return
end

local status, lspkind = pcall(require, "lspkind")

if not status then
	return
end

require("lspkind").init({
	mode = "symbol_text",
	preset = "codicons",
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "luasnip" },
	},
	formatting = {
		format = lspkind.cmp_format({ maxwidth = 50 }),
	},
	experimental = {
		ghost_text = true,
	},
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
]])

-- No longer needed?
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- Setup mason
local status, mason = pcall(require, "mason")

if not status then
	print("[WARN] mason is not installed and its required to install language servers")
	return
end

local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
	print("[WARN] mason-lspconfig is not installed and its required to install language servers")
	return
end

mason.setup({})
masonlsp.setup({
	ensure_installed = { "sumneko_lua", "tsserver" },
})

-- Setup lspconfig
require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
require("lspconfig").tsserver.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").gopls.setup({})

-- Setup treesitter
local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
	print("[WARN] treesitter is not installed and is needed to make this config work correctly")
	return
end

require("nvim-treesitter.configs").setup({
	indent = { enable = true },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"tsx",
		"lua",
		"python",
		"typescript",
		"css",
		"json",
		"rust",
	},
})
