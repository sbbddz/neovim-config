---- [[  COLORSCHEME  ]]
local colorscheme = "carbonfox"

if colorscheme == "ayu" then
	vim.cmd([[colorscheme ayu-dark]])
elseif colorscheme == "carbonfox" then
	vim.cmd([[colorscheme carbonfox]])
end

vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
