local status, lualine = pcall(require, "lualine")

if not status then
	print("[WARN] No lualine is installed")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				show_modified_status = true,
				mode = 2,
				filetype_names = {
					netrw = "Files",
				},
				symbols = {
					modified = "*",
					alternate_file = "",
					directory = "",
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})

