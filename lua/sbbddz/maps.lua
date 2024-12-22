local keymap = vim.keymap
local terminal = require("sbbddz.terminal")

--- [[ FAST AS LIGHT ]]
keymap.set("n", "<Tab>", "<C-i>")
keymap.set("n", "<S-Tab>", "<C-o>")

--- [[ BUFFERS ]]
keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")
keymap.set("n", "<leader>bd", ":bd<cr>")

--- [[ WINDOWS ]]
keymap.set("n", "<leader>ss", ":split<cr>")
keymap.set("n", "<leader>vs", ":vs<cr>")
keymap.set("n", "<leader>so", terminal.toggle_window_fullscreen)

--- [[ NETRW ]]
keymap.set("n", "<leader>nt", ":Ex<cr>")

--- [[ QUICKFIX ]]
keymap.set("n", "<leader>cc", ":cclose<cr>")
keymap.set("n", "<leader>co", ":copen<cr>")
keymap.set("n", "<C-n>", ":cnext<cr>")
keymap.set("n", "<C-p>", ":cprev<cr>")

--- [[ TERMINAL ]]
keymap.set("n", "<C-t>", terminal.open_or_create_term_buffer, { noremap = true })
keymap.set("n", "<leader>t", terminal.toggle_term_in_current_window, { noremap = true })
keymap.set("t", "<Esc>", "<C-\\><C-n>")

--- [[ MISCELLANEA ]]
keymap.set("i", "<C-c>", "<ESC>")
