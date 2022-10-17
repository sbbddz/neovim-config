local status, bfline = pcall(require, "bufferline")

if not status then
	print("[WARN] No lualine is installed")
	return
end

bfline.setup({
  options = {
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp"
  },
})
