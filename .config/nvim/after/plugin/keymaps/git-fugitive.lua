local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap('n', 'gpl', ':Git pull<CR>', { noremap = true })
keymap('n', '<leader>p', ':GFiles<CR>', opts)
keymap('n', '<leader>gs', ':Git<CR>', opts)
keymap('n', '<leader>ga', ':Git add .<CR>', opts)
keymap('n', '<leader>gp', ':Git -c push.default=current push<CR>', opts)
keymap('n', '<leader>gc', ':GBranches track<CR>', opts)
keymap('n', '<leader>gh', ':diffget //2<CR>', opts)
keymap('n', '<leader>gl', ':diffget //3<CR>', opts)
