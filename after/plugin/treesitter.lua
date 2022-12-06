--- [[  TREESITTER  ]]
local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
	print("[WARN] treesitter is not installed and is needed to make this config work correctly")
	return
end

treesitter.setup({
	indent = { enable = true },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"tsx",
		"lua",
		"python",
		"typescript",
		"css",
		"json",
		"rust",
	},
})
