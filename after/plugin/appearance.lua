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
		mocha = { -- Borrowed from https://github.com/catppuccin/nvim/discussions/323#discussioncomment-6410765
			rosewater = "#ffc9c9",
			flamingo = "#ff9f9a",
			pink = "#ffa9c9",
			mauve = "#df95cf",
			lavender = "#a990c9",
			red = "#ff6960",
			maroon = "#f98080",
			peach = "#f9905f",
			yellow = "#f9bd69",
			green = "#b0d080",
			teal = "#a0dfa0",
			sky = "#a0d0c0",
			sapphire = "#95b9d0",
			blue = "#89a0e0",
			text = "#e4e4e4",
			subtext1 = "#d5c4a1",
			subtext0 = "#bdae93",
			overlay2 = "#928374",
			overlay1 = "#7c6f64",
			overlay0 = "#665c54",
			surface2 = "#504844",
			surface1 = "#3a3634",
			surface0 = "#252525",
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
