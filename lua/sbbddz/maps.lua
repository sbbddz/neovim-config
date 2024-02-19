local keymap = vim.keymap

--- [[ FAST AS LIGHT ]]
keymap.set("n", "<Tab>", "<C-i>")
keymap.set("n", "<S-Tab>", "<C-o>")

--- [[ BUFFERS ]]
keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")
keymap.set("n", "<leader>bd", ":bd<cr>")

--- [[ NETRW ]]
keymap.set("n", "<leader>nt", ":Ex<cr>")

--- [[ QUICKFIX ]]
keymap.set("n", "<leader>cc", ":cclose<cr>")
keymap.set("n", "<C-n>", ":cnext<cr>")
keymap.set("n", "<C-p>", ":cprev<cr>")

--- [[ MISCELLANEA ]]
keymap.set("i", "<C-c>", "<ESC>")
keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("n", "<leader>tt", ":terminal<cr>")
keymap.set("n", "<leader>st", ":split<cr> :terminal<cr>")
keymap.set("n", "<leader>vs", ":vs<cr>")
