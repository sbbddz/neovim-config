---- [[  COLORSCHEME  ]]
local kana = require("kanagawa.colors").setup({ theme = "dragon" })
local theme = kana.theme
local telescope_overrides = {
	TelescopeTitle = { fg = theme.ui.special, bold = true },
	TelescopePromptNormal = { bg = theme.ui.bg_p1, fg = "#e2e2e2" },
	TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
	TelescopeResultsNormal = { fg = "#bebebe", bg = theme.ui.bg_m1 },
	TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
	TelescopePreviewNormal = { bg = theme.ui.bg_dim },
	TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
}

require("catppuccin").setup({
	flavor = "mocha",
	color_overrides = {
		mocha = { -- Inspiration from https://github.com/catppuccin/nvim/discussions/323#discussioncomment-8445178
			rosewater = "#ffffff",
			flamingo = "#ffffff",
			red = "#ddc02c",
			maroon = "#ffffff",
			pink = "#ffdd33",
			mauve = "#ffdd33",
			peach = "#96a6c8",
			yellow = "#88b992",
			green = "#73c936",
			teal = "#88b992",
			sky = "#cc8c3c",
			sapphire = "#96a6c8",
			blue = "#9ab8d3",
			lavender = "#9ab8d3",
			text = "#e4e4e4",
			subtext1 = "#d5c9b7",
			subtext0 = "#bfb3a5",
			overlay2 = "#aca195",
			overlay1 = "#958b7e",
			overlay0 = "#6f6660",
			surface2 = "#585858",
			surface1 = "#4b4b4b",
			surface0 = "#353535",
			base = "#151515",
			mantle = "#0e0e0e",
			crust = "#080808",
		},
	},
	custom_highlights = telescope_overrides,
})

require("kanagawa").setup({
	colors = {
		palette = {
			fujiWhite = "#e4e4e4",
		},
	},
	overrides = function(_)
		return telescope_overrides
	end,
})

local function use_colorscheme(colorscheme)
	vim.cmd.colorscheme(colorscheme)
	vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
	vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
end

vim.api.nvim_create_user_command("Catppuccin", function()
	use_colorscheme("catppuccin")
end, {})
vim.api.nvim_create_user_command("Kanagawa", function()
	use_colorscheme("kanagawa")
end, {})

use_colorscheme("catppuccin")
