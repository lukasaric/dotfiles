local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- use enter to open file with finder
	finder = {
		open = "<CR>",
	},
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	lightbulb = {
		enable = false,
	},
})
