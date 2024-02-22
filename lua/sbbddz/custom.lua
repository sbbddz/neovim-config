-- [[ CUSTOM FUNCTIONS ]]
local M = {}

local function is_terminal_buffer(buf)
	return string.match(vim.api.nvim_buf_get_name(buf), "term")
end

local function get_term_buffer_if_exists()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if is_terminal_buffer(buf) then
			return buf
		end
	end

	return nil
end

---
---Opens or creates a new terminal if required. If called from an existing terminal,
---closes the window
---
function M.open_or_create_term_buffer()
	local buf = get_term_buffer_if_exists()
	local current_tabpage = vim.api.nvim_get_current_tabpage()
	local current_number_of_splits = vim.api.nvim_tabpage_list_wins(current_tabpage)

	for _, w in ipairs(current_number_of_splits) do
		if vim.api.nvim_win_get_buf(w) == buf then
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
		vim.cmd(":8split")
		vim.cmd(":term")
	else
		vim.cmd(string.format(":8split #%s", buf))
	end
end

return M
