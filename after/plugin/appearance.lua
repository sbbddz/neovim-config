--- [[  INDENT BLANKLINE  ]]
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

---- [[  COLORSCHEME  ]]
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.catppuccin_flavour = "macchiato"

vim.cmd [[colorscheme tokyonight]]

require("tokyonight").setup({
	style = "night",
	transparent = true
})

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
		theme = "ayu_dark",
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
})
