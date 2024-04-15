---- [[  COLORSCHEME  ]]
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
			green = "#abd37a",
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
	}
})

vim.cmd.colorscheme("catppuccin")
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
