local opt = vim.opt

vim.g.mapleader = " "

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

-- Add color column ruler
opt.colorcolumn = "80"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Ignore case while searching
opt.ignorecase = true
-- If you include mixed case in your search, assumes you want case-sensitive
opt.smartcase = true

-- Clipboard
opt.clipboard:append("unnamedplus")

opt.smartindent = true
opt.shortmess:append("c")

-- Don't wrap lines
opt.wrap = false

-- Time in ms if nothing is typed, swap will be written to disk
opt.updatetime = 50
-- Always show signcolumn - column for displaying git changes, errors etc...
opt.signcolumn = "yes"
-- Highlight the current line
opt.cursorline = true

opt.termguicolors = true

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.modifiable = true

-- Open new vertical splits right
opt.splitright = true
opt.splitbelow = true

opt.background = "dark"
