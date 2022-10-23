local status, bfline = pcall(require, "cokeline")

if not status then
	print("[WARN] No lualine is installed")
	return
end

local get_hex = require("cokeline/utils").get_hex
local green = vim.g.terminal_color_2

vim.cmd([[
  let g:netrw_bufsettings = 'noma nomod nonu nowrap ro buflisted'
]])

bfline.setup({
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and nil or get_hex("Comment", "fg")
		end,
		bg = "none",
	},
	components = {
		{ text = " " },
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.unique_prefix .. buffer.filename
			end,
			fg = function(buffer)
				if buffer.is_focused then
					return "#78dce8"
				end
				if buffer.is_modified then
					return "#e5c463"
				end
			end,
			style = function(buffer)
				if buffer.is_focused then
					return "underline"
				end
				return nil
			end,
		},
		{ text = " " },
		{
			text = function(buffer)
				return buffer.is_modified and "●" or ""
			end,
			fg = function(buffer)
				return buffer.is_modified and green or nil
			end,
			delete_buffer_on_left_click = true,
			truncation = { priority = 1 },
		},
		{ text = " " },
	},
})
