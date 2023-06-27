---- [[  DAP (Debugger Adapter Protocol) ]]
local status, dap = pcall(require, "dap")

if not status then
	print("[WARN] Debugger Adapter Protocol is not installed")
end

-- NOTE: On macos is required to compile netcoredbg from source and not install it from
-- Mason as netcoredbg isn't generally avaliable for ARM nor downloable from Mason
local arch = vim.fn.system("uname -a")
local command = string.find(arch, "arm64") and "/usr/local/netcoredbg" or "netcoredbg"

dap.adapters.coreclr = {
	type = "executable",
	command = command,
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
	},
}

local keymap = vim.keymap

keymap.set("n", "<leader>bp", function()
	dap.toggle_breakpoint()
end, {})
keymap.set("n", "<leader>bc", function()
	dap.continue()
end, {})
keymap.set("n", "<leader>br", function()
	require("dap.repl").toggle()
end, {})
keymap.set("n", "<leader>bs", function()
	dap.terminate()
end, {})
