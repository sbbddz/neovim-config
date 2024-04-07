local keymap = vim.keymap
local custom = require("sbbddz.custom")

--- [[ FAST AS LIGHT ]]
keymap.set("n", "<Tab>", "<C-i>")
keymap.set("n", "<S-Tab>", "<C-o>")

--- [[ BUFFERS ]]
keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")
keymap.set("n", "<leader>bd", ":bd<cr>")

--- [[ WINDOWS ]]
keymap.set("n", "<leader>ss", ":split<cr>")
keymap.set("n", "<leader>vs", ":vs<cr>")
keymap.set("n", "<leader>so", custom.toggle_window_fullscreen)

--- [[ NETRW ]]
keymap.set("n", "<leader>nt", ":Ex<cr>")

--- [[ QUICKFIX ]]
keymap.set("n", "<leader>cc", ":cclose<cr>")
keymap.set("n", "<leader>co", ":copen<cr>")
keymap.set("n", "<C-n>", ":cnext<cr>")
keymap.set("n", "<C-p>", ":cprev<cr>")

--- [[ TERMINAL ]]
keymap.set("n", "<leader>tt", custom.open_or_create_term_buffer)
keymap.set("n", "<C-t>", custom.toggle_term_in_current_window)
keymap.set("t", "<Esc>", "<C-\\><C-n>")

--- [[ MISCELLANEA ]]
keymap.set("i", "<C-c>", "<ESC>")
