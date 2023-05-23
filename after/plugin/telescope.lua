--- [[  TELESCOPE  ]]
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
keymap.set("n", "<C-f>", builtin.git_files, {})
keymap.set("n", "<leader>fp", builtin.live_grep, {})
keymap.set("n", "<leader>ftb", builtin.current_buffer_fuzzy_find, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fc", builtin.command_history, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})

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
	},
})
