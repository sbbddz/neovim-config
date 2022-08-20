local keymap = vim.keymap
local status, lspsaga = pcall(require, "lspsaga")

if not status then
	return
end

lspsaga.init_lsp_saga()

local opts = { noremap = true, silent = true }
keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<cr>", opts)
keymap.set("n", "gr", "<Cmd>Lspsaga rename<cr>", opts)
