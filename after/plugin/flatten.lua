local status, flatten = pcall(require, "flatten")

if not status then
	return
end

flatten.setup({})
