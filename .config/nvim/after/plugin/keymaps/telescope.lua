local keymap = vim.keymap

-- find files within current working directory, respects .gitignore
keymap.set("n", "<C-p>", "<cmd>Telescope find_files hidden=true<cr>")
-- find string in current working directory as you type
keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>")
-- find string under cursor in current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- list open buffers in current neovim instance
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
