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
})
