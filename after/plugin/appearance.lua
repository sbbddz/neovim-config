---- [[  COLORSCHEME  ]]
local colorscheme = "ayu"

if colorscheme == "ayu" then
	vim.cmd([[colorscheme ayu-dark]])
elseif colorscheme == "nightfox" then
	vim.cmd([[colorscheme carboxfox]])
end

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
