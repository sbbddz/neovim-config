--- [[  NVIM CMP  ]]
local status, cmp = pcall(require, "cmp")

if not status then
	return
end

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
]])

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path",    keyword_length = 5 },
		{ name = "buffer",  keyword_length = 5 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "jira",    keyword_length = 1 },
	},
	formatting = {
		format = function(entry, item)
			local short_name = {
				nvim_lsp = "LSP",
				nvim_lua = "NVIM",
				path = "PATH",
				buffer = "BUFF",
			}

			local menu_name = short_name[entry.source.name] or entry.source.name

			item.menu = string.format("(%s)", menu_name)
			return item
		end,
	},
})
