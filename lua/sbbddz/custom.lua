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
---Toggles the terminal. If there is no terminal buffer, creates one.
---If there is a window with a terminal open, closes it.
---
function M.open_or_create_term_buffer()
	local buf = get_term_buffer_if_exists()
	local current_tabpage = vim.api.nvim_get_current_tabpage()
	local current_number_of_splits = vim.api.nvim_tabpage_list_wins(current_tabpage)

	-- Close the terminal even from other windows
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

---
---Toggles the current window as a full screen window.
---In behind, it just creates a new tab and destroys it when you're not in main tab
---This would not work if using tabs, for example, creating it manually, but
---I don't use tabs, so its OK
---
function M.toggle_window_fullscreen()
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

return M
