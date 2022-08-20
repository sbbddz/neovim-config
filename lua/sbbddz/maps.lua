local keymap = vim.keymap

--- BUFFERS
keymap.set("n", "<Tab>", ":bnext<cr>")
keymap.set("n", "<S-Tab>", ":bprevious<cr>")
keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")

--- TELESCOPE
keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
keymap.set("n", "<C-p>", function()
	require("telescope.builtin").buffers()
end)
keymap.set("n", "<C-f>", function()
	require("telescope.builtin").git_files()
end)
keymap.set("n", "<leader>fp", function()
	require("telescope.builtin").live_grep()
end)

--- FORMAT
keymap.set("n", "<leader>bf", ":Neoformat<cr>")

keymap.set("n", "<leader>nt", ":Ex<cr>")
