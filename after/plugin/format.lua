local status, formatter = pcall(require, "formatter")

local formatter_config = {
	lua = {
		require("formatter.filetypes.lua").stylua,
	},
}

local prettier_config = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
		stdin = true,
	}
end

local prettier_languages = {
	"css",
	"scss",
	"html",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"markdown",
	"json",
	"yaml",
	"xml",
	"svg",
}

for _, prtlanguage in ipairs(prettier_languages) do
	formatter_config[prtlanguage] = { prettier_config }
end

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = formatter_config,
})
