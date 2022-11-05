local setup, autopairs = pcall(require, "nvim-autopairs")
if not setup then
	return
end

autopairs.setup({ enable_check_bracket_line = false })
