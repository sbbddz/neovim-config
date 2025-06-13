--- [[ ]]
--- [[ NEOVIM single file configuration ]]
--- [[ by @sbbddz ]]
--- [[ ]]
---@diagnostic disable: redefined-local
vim.loader.enable()

--- [[  EARLY MAPS  ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--- [[ ]]

--- [[  SETS  ]]
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.shell = "zsh"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showtabline = 0
vim.opt.termguicolors = true
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.shortmess:append("c")
vim.opt.path:append("**")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.updatetime = 50
vim.opt.signcolumn = "number"
-- don't treat _ as part of the word
vim.opt.iskeyword:remove("_")
-- default, acutally handled by vim-sleuth
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
-- fix: asterisks in block comments
vim.opt.formatoptions:append({ "r" })
-- fix: no comments when using o
vim.opt.formatoptions:remove({ "o" })
-- show characters in vim
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.undofile = true
--- [[ ]]

--- [[  REMAPS  ]]
local keymap = vim.keymap
keymap.set("n", "<Tab>", "<C-i>")
keymap.set("n", "<S-Tab>", "<C-o>")
keymap.set("n", "<leader>bq", ":w<cr>:bp <BAR> bd #<cr>")
keymap.set("n", "<leader>bd", ":bd<cr>")
keymap.set("n", "<leader>ss", ":split<cr>")
keymap.set("n", "<leader>vs", ":vs<cr>")
keymap.set("n", "<leader>nt", ":e .<cr>")
keymap.set("n", "<leader>cc", ":cclose<cr>")
keymap.set("n", "<leader>co", ":copen<cr>")
keymap.set("n", "<C-n>", ":cnext<cr>")
keymap.set("n", "<C-p>", ":cprev<cr>")
keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("i", "<C-c>", "<ESC>")
--- [[ ]]

--- [[  PLUGINS  ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	--- MISCELLANEA
	{ "willothy/flatten.nvim", opts = {} },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "tpope/vim-fugitive" },
	{
		"stevearc/oil.nvim",
		opts = {
			keymaps = {
				["<C-t>"] = false,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	--- LSP
	{ "mason-org/mason.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "saadparwaiz1/cmp_luasnip" },
	--- IDE
	{ "windwp/nvim-autopairs", opts = {} },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "mfussenegger/nvim-dap" },
	{ "tpope/vim-sleuth" },
	{ "stevearc/conform.nvim", opts = {} },
	--- APPEARANCE
	{ "kyazdani42/nvim-web-devicons" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rebelot/kanagawa.nvim" },
	--- OTHER LANGUAGES
	{ "Hoffs/omnisharp-extended-lsp.nvim" },
}, {
	ui = {
		size = {
			height = 0.6,
		},
		icons = nil,
		border = "single",
	},
})
--- [[ ]]

--- [[ TERMINAL ]]
local Terminal = {}

local function is_terminal_buffer(buf)
	return string.match(vim.api.nvim_buf_get_name(buf), "term://")
end

local function get_term_buffer_if_exists()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if is_terminal_buffer(buf) then
			return buf
		end
	end

	return nil
end

---Toggles the terminal. If there is no terminal buffer, creates one.
---If there is a window with a terminal open, closes it.
function Terminal.open_or_create_term_buffer()
	local buf = get_term_buffer_if_exists()
	local current_tabpage = vim.api.nvim_get_current_tabpage()
	local current_number_of_splits = vim.api.nvim_tabpage_list_wins(current_tabpage)

	-- Close the terminal even from other windows
	for _, w in ipairs(current_number_of_splits) do
		if vim.api.nvim_win_get_buf(w) == buf and #current_number_of_splits > 1 then
			vim.api.nvim_win_close(w, true)
			return
		end
	end

	-- If we're in the terminal we want to close the window but keep the buffer
	if buf == vim.api.nvim_get_current_buf() and #current_number_of_splits > 1 then
		vim.cmd(":wincmd q")
		return
	end

	-- I don't know how to split a window with lua commands
	if buf == nil then
		vim.cmd(":10split")
		vim.cmd(":term")
	else
		vim.cmd(string.format(":10split #%s", buf))
	end
end

---Toggles the current window as a full screen window.
---In behind, it just creates a new tab and destroys it when you're not in main tab
---This would not work if using tabs, for example, creating it manually, but
---I don't use tabs, so its OK
function Terminal.toggle_window_fullscreen()
	local current_tabpage = vim.api.nvim_get_current_tabpage()
	local current_number_of_splits = vim.api.nvim_tabpage_list_wins(current_tabpage)

	-- Do not create a tab when unexpectedly issued the command
	if #current_number_of_splits <= 1 and current_tabpage == 1 then
		return
	end

	if current_tabpage ~= 1 then
		vim.cmd(":tabclose")
	else
		vim.cmd(":tabnew %")
	end
end

function Terminal.toggle_term_in_current_window()
	local term_buf = get_term_buffer_if_exists()

	if term_buf == vim.api.nvim_get_current_buf() then
		vim.cmd(":e #")
		return
	end

	if term_buf ~= nil then
		vim.api.nvim_set_current_buf(term_buf)
	else
		vim.cmd(":term")
	end
end

keymap.set("n", "<C-t>", Terminal.open_or_create_term_buffer, { noremap = true })
keymap.set("n", "<leader>t", Terminal.toggle_term_in_current_window, { noremap = true })
keymap.set("n", "<leader>so", Terminal.toggle_window_fullscreen)
--- [[ ]]

---- [[  COLORSCHEME  ]]
require("catppuccin").setup({
	flavor = "mocha",
	color_overrides = {
		mocha = { -- Inspiration from https://github.com/catppuccin/nvim/discussions/323#discussioncomment-8445178
			rosewater = "#ffffff",
			flamingo = "#ffffff",
			red = "#ddc02c",
			maroon = "#ffffff",
			pink = "#ffdd33",
			mauve = "#ffdd33",
			peach = "#96a6c8",
			yellow = "#88b992",
			green = "#abd37a",
			teal = "#88b992",
			sky = "#cc8c3c",
			sapphire = "#96a6c8",
			blue = "#9ab8d3",
			lavender = "#9ab8d3",
			text = "#e4e4e4",
			subtext1 = "#d5c9b7",
			subtext0 = "#bfb3a5",
			overlay2 = "#aca195",
			overlay1 = "#958b7e",
			overlay0 = "#6f6660",
			surface2 = "#585858",
			surface1 = "#4b4b4b",
			surface0 = "#353535",
			base = "#151515",
			mantle = "#0e0e0e",
			crust = "#080808",
		},
	},
})
require("kanagawa").setup({
	colors = {
		palette = {
			sumiInk0 = "#191919",
			sumiInk4 = "#DCD7BA",
			oldWhite = "#DCD7BA",
			springViolet1 = "#DCD7BA",
		},
	},
	overrides = function(_)
		return {
			LineNr = { fg = "#6D6951" },
			SpecialKey = { fg = "#6D6951" },
			Whitespace = { fg = "#6D6951" },
		}
	end,
})
-- vim.cmd.colorscheme("catppuccin")
vim.cmd("colorscheme kanagawa")
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
--- [[ ]]

--- [[  NVIM-CMP  ]]
local status, cmp = pcall(require, "cmp")

if not status then
	return
end

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
]])

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path", keyword_length = 5 },
		{ name = "buffer", keyword_length = 5 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "jira", keyword_length = 1 },
		{ name = "supermaven" },
	},
	formatting = {
		format = function(entry, item)
			local short_name = {
				nvim_lsp = "LSP",
				nvim_lua = "NVIM",
				path = "PATH",
				buffer = "BUFF",
				supermaven = "AI",
			}

			local menu_name = short_name[entry.source.name] or entry.source.name

			item.menu = string.format("(%s)", menu_name)
			return item
		end,
	},
})
--- [[ ]]

---- [[  DAP ]]
local status, dap = pcall(require, "dap")

if not status then
	print("[WARN] Debugger Adapter Protocol is not installed")
end

-- NOTE: On macos is required to compile netcoredbg from source and not install it from
-- Mason as netcoredbg isn't generally avaliable for ARM nor downloable from Mason
local arch = vim.fn.system("uname -a")
local command = string.find(arch, "arm64") and "/usr/local/netcoredbg" or "netcoredbg"

dap.adapters.coreclr = {
	type = "executable",
	command = command,
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd(), "file")
		end,
	},
	{
		type = "coreclr",
		name = "launch - netcoredbg - process",
		request = "attach",
		processId = function()
			return vim.fn.input("")
		end,
	},
}

keymap.set("n", "<leader>bp", dap.toggle_breakpoint, {})
keymap.set("n", "<leader>bc", dap.continue, {})
keymap.set("n", "<leader>br", require("dap.repl").toggle, {})
keymap.set("n", "<leader>bs", dap.terminate, {})
local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    for _, keymap in pairs(keymaps) do
      if keymap.lhs == "K" then
        table.insert(keymap_restore, keymap)
        api.nvim_buf_del_keymap(buf, 'n', 'K')
      end
    end
  end
  api.nvim_set_keymap(
    'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
end

dap.listeners.after['event_terminated']['me'] = function()
  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(
      keymap.buffer,
      keymap.mode,
      keymap.lhs,
      keymap.rhs,
      { silent = keymap.silent == 1 }
    )
  end
  keymap_restore = {}
end
--- [[ ]]

--- [[  LSP CONFIG  ]]
local status, mason = pcall(require, "mason")
if not status then
	print("[WARN] mason is not installed and its required to install language servers")
	return
end

mason.setup({})

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
	map("n", "<leader>bf", ":Format<cr>")
end

local function on_attach(_, bufnr)
	local buf_command = vim.api.nvim_buf_create_user_command

	buf_command(bufnr, "LspFormat", function()
		vim.lsp.buf.format()
	end, { desc = "Format buffer with language server" })

	lsp_keymaps(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.config('*', {
	on_attach = on_attach,
	capabilities = capabilities
})

vim.lsp.config('lua_ls', {
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

vim.lsp.config('omnisharp', {
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").definition_handler,
		["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
		["textDocument/references"] = require("omnisharp_extended").references_handler,
	},
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	settings = {
		FormattingOptions = {
			OrganizeImports = true,
		},
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = true,
			EnableImportCompletion = true,
			AnalyzeOpenDocumentsOnly = true,
		},
	},
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


local enabled_servers = {
	"lua_ls",
	"ts_ls",
	"gopls",
	"templ",
	"omnisharp",
	"tailwindcss",
	"zls",
	"astro",
	"ruby_lsp",
}
vim.lsp.enable(enabled_servers)

--- [[ ]]

---- [[  TELESCOPE  ]]
local telescope_foreground_color = "#e2e2e2"
local telescope_background_color = "#191919"
local telescope_overrides = {
	TelescopeTitle = { fg = telescope_foreground_color, bold = true },
	TelescopePromptNormal = { bg = telescope_background_color, fg = telescope_foreground_color },
	TelescopePromptBorder = { fg = telescope_background_color, bg = telescope_background_color },
	TelescopeResultsNormal = { fg = telescope_foreground_color, bg = telescope_background_color },
	TelescopeResultsBorder = { fg = telescope_background_color, bg = telescope_background_color },
	TelescopePreviewNormal = { bg = telescope_background_color },
	TelescopePreviewBorder = { bg = telescope_background_color, fg = telescope_background_color },
}

for hl, col in pairs(telescope_overrides) do
	vim.api.nvim_set_hl(0, hl, col)
end

local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local status, builtin = pcall(require, "telescope.builtin")
if not status then
	return
end

keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		hidden = true,
	})
end)
keymap.set("n", "<C-e>", builtin.buffers, {})
keymap.set("n", "<leader>fp", builtin.live_grep, {})
keymap.set("n", "<leader>fb", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, {})
keymap.set("n", "<leader>fg", builtin.git_files, {})
keymap.set("n", "<leader>fc", builtin.command_history, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})

local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git",
			".vscode",
			".idea",
			".angular",
			"obj",
		},
		preview = {
			filesize_limit = 0.3,
		},
	},
	pickers = {
		buffers = {
			mappings = {
				n = {
					["dd"] = actions.delete_buffer,
					["ww"] = function()
						vim.cmd([[wa]])
					end,
				},
			},
		},
	},
})
--- [[ ]]

--- [[  TREESITTER  ]]
local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
	print("[WARN] treesitter is not installed and is needed to make this config work correctly")
	return
end

---@diagnostic disable-next-line: missing-fields
treesitter.setup({
	ensure_installed = {
		"tsx",
		"lua",
		"python",
		"typescript",
		"css",
		"json",
		"rust",
		"markdown",
	},
	indent = { enable = true },
	auto_install = true,
	highlight = { enable = true },
	incremental_selection = { enable = true },
})
--- [[ ]]

--- [[  CONFORM  ]]
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		astro = { "prettierd", "prettier", stop_after_first = true },
		ruby = { "rubocop" },
	},
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
--- [[ ]]
