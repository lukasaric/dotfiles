local keymap = vim.keymap
local opts = { noremap = true }
local allModes = { "n", "v", "i" }

keymap.set(allModes, "<C-h>", "<C-w>h")
keymap.set(allModes, "<C-j>", "<C-w>j")
keymap.set(allModes, "<C-k>", "<C-w>k")
keymap.set(allModes, "<C-l>", "<C-w>l")

keymap.set("n", "<c-s>", ":w<cr>")
keymap.set("n", "<leader>pf", ":e#", opts)

keymap.set("n", "<space><space>", ":nohlsearch<Bar>:echo<CR>", { silent = true })

-- make split windows equal width & height
keymap.set("n", "<leader>se", "<C-w>=")
-- close current split window
keymap.set("n", "<leader>sx", ":close<CR>")
-- yank to clipboard
keymap.set("n", "<leader>y", '"+y', opts)
keymap.set("v", "<leader>y", '"+y', opts)

-- Tabs
keymap.set("n", "<leader>tn", ":tabnew<Space>", opts)
keymap.set("n", "<leader>tc", ":tabclose<CR>", opts)
