local keymap = vim.keymap.set
local opts = { noremap = true }

keymap("n", "<C-t>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-f>", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<C-c>", ":NvimTreeClose<CR>", opts)
