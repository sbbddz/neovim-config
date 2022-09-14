vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.catppuccin_flavour = "macchiato"

require("catppuccin").setup({
  transparent_background = true
})

vim.cmd("colorscheme tokyonight")
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
