set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.config/nvim/core-mappings.vim

source ~/.config/nvim/plugins/index.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/git-fugitive.vim

luafile ~/.config/nvim/plugins/lualine.lua
luafile ~/.config/nvim/plugins/nvim-treesitter.lua
luafile ~/.config/nvim/plugins/nvim-autopairs.lua

source ~/.config/nvim/plugins/coc.vim

let g:tokyonight_italic_functions = 0
colorscheme tokyonight
