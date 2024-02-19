vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.shell = 'zsh'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showtabline = 0
vim.opt.termguicolors = true

vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.mouse = 'a'
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.shortmess:append('c')
vim.opt.path:append('**')
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.signcolumn = 'number'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

-- fix: asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.opt.undofile = true
