local keymap = vim.keymap
local has_cokeline, _ = pcall(require, "cokeline")

--- [[ BUFFERS ]]
if has_cokeline then
	keymap.set("n", "<Tab>", "<Plug>(cokeline-focus-next)")
	keymap.set("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)")
else
	keymap.set("n", "<Tab>", ":bnext<cr>")
	keymap.set("n", "<S-Tab>", ":bprevious<cr>")
end

keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")

--- [[ FORMAT ]]
keymap.set("n", "<leader>bf", ":Neoformat<cr>")
keymap.set("n", "<leader>nt", ":Ex<cr>")

--- [[ QUICKFIX ]]
keymap.set("n", "<leader>cc", ":cclose<cr>")
keymap.set("n", "<leader>cn", ":cnext<cr>")
keymap.set("n", "<leader>cp", ":cprev<cr>")

--- [[ MISCELLANEA ]]
keymap.set("i", "<C-c>", "<ESC>")
