vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.catppuccin_flavour = "macchiato"

-- require('neosolarized').setup({})
-- require('catppuccin').setup({})

require('onedark').setup({
  theme = "darker",
  transparent = "true"
})

require('onedark').load()

-- vim.cmd("colorscheme carbonfox")
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")

