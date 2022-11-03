vim.g.tokyonight_italic_functions = false

local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status then
	print("Colorscheme not found!")
	return
end
