local status, telescope = pcall(require, "telescope")

if not status then
	return
end

--[[telescope.setup({
	defaults = {
		file_ignore_patterns = {
			{
				"node_modules",
				".git",
				".vscode",
				".idea",
				".angular",
			},
		},
		pickers = {
			"find_files" = { hidden = true },
		},
	},
})
]]--