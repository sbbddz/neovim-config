local keymap = vim.keymap
local cokeline, _ = pcall(require, "cokeline")

--- BUFFERS
if cokeline then
	keymap.set("n", "<Tab>", "<Plug>(cokeline-focus-next)")
	keymap.set("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)")
else
	keymap.set("n", "<Tab>", ":bnext<cr>")
	keymap.set("n", "<S-Tab>", ":bprevious<cr>")
end

keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")

--- TELESCOPE
keymap.set("n", "<leader>ff", function() 
  require("telescope.builtin").find_files({
    hidden = true
  })
end)
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
