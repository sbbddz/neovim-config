--- [[  INDENT BLANKLINE  ]]
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	show_end_of_line = true,
	space_char_blankline = " ",
})

---- [[  COLORSCHEME  ]]
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.catppuccin_flavour = "macchiato"

require("onedark").setup({
	theme = "darker",
	transparent = "true",
})

require("onedark").load()

vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")

---- [[  LUALINE  ]]
local status, lualine = pcall(require, "lualine")

if not status then
	print("[WARN] No lualine is installed")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
})
