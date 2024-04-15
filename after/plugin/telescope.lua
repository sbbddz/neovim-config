---- [[  APPEARANCE  ]]
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

---- [[  CONFIGURATION  ]]
local keymap = vim.keymap

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
