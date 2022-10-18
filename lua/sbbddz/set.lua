vim.g.mapleader = " "

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.shell = 'zsh'

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.mouse = 'a'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.ignorecase = true

vim.opt.shortmess:append('c')
vim.opt.path:append('**')
--vim.opt.wildmenu = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.showtabline = 2

vim.opt.signcolumn = 'number'

vim.opt.termguicolors = true

-- Asterisks in block comments
vim.opt.formatoptions:append { 'r' }