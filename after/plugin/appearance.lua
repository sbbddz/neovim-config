---- [[  COLORSCHEME  ]]
require("kanagawa").setup({
	colors = {
		palette = {
			fujiWhite = "#e4e4e4",
		},
	},
	overrides = function(colors)
		local kana = require("kanagawa.colors").setup({ theme = "dragon" })
		local theme = kana.theme
		return {
			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1, fg = "#e2e2e2" },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = "#bebebe", bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
		}
	end,
})

vim.cmd([[colorscheme kanagawa-wave]])
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
