local keymap = vim.keymap

--- [[ BUFFERS ]]
keymap.set("n", "<Tab>", ":bnext<cr>")
keymap.set("n", "<S-Tab>", ":bprevious<cr>")

keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")
keymap.set("n", "<leader>bd", ":bd<cr>")
keymap.set("n", "<leader>bb", "<C-o>")

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
