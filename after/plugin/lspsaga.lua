local keymap = vim.keymap
local status, lspsaga = pcall(require, "lspsaga")

if not status then
	return
end

lspsaga.init_lsp_saga()

local opts = { noremap = true, silent = true }
keymap.set("n", "gj", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap.set("n", "gk", "<Cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<cr>", opts)
keymap.set("n", "gr", "<Cmd>Lspsaga rename<cr>", opts)
keymap.set("n", "ga", "<Cmd>Lspsaga code_action<cr>", opts)
keymap.set("n", "gs", "<Cmd>Lspsaga show_line_diagnostics<cr>", opts)
