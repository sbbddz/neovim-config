--- [[  GLOBALS  ]]
local servers = {
	"tailwindcss",
	"tsserver",
	"rust_analyzer",
	"cssls",
	"html",
	"gopls",
	"eslint",
	"pyright",
	"zls",
	"omnisharp",
	"lua_ls"
}

--- [[  MASON && MASONLSP  ]]
local status, mason = pcall(require, "mason")

if not status then
	print("[WARN] mason is not installed and its required to install language servers")
	return
end

local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
	print("[WARN] mason is not installed and its required to install language servers")
	return
end

mason.setup({})
masonlsp.setup({
	ensure_installed = servers
})

--- [[  LSP KEYMAPS  ]]
local function lsp_keymaps(bufnr)
	local map = function(m, lhs, rhs)
		local opts = { remap = false, silent = true, buffer = bufnr }
		vim.keymap.set(m, lhs, rhs, opts)
	end

	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
	map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
	map("n", "ge", "<cmd>lua vim.lsp.buf.references()<cr>")
	map("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>")
	map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	map("n", "<leader>bf", "<cmd>Format<cr>")
end

--- [[  LSP CONFIG  ]]
local status, lspconfig = pcall(require, "lspconfig")

if not status then
	print("[WARN] lspconfig is not installed and its required to install language servers")
	return
end

local function on_attach(_, bufnr)
	local buf_command = vim.api.nvim_buf_create_user_command

	buf_command(bufnr, "LspFormat", function()
		vim.lsp.buf.format()
	end, { desc = "Format buffer with language server" })

	lsp_keymaps(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

require("lspconfig").omnisharp.setup({
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").handler,
	},
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
		for i, v in ipairs(tokenModifiers) do
			tokenModifiers[i] = v:gsub(" ", "_")
		end
		local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
		for i, v in ipairs(tokenTypes) do
			tokenTypes[i] = v:gsub(" ", "_")
		end
	end,
	capabilities = capabilities,
})
