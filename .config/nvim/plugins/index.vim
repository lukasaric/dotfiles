packadd! matchit
call plug#begin(expand('~/.vim/plugged'))
  Plug 'windwp/nvim-autopairs'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'junegunn/fzf', { 'do': { -> fzf.install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'mattn/emmet-vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'Oldenborg/vim-px-to-rem'
call plug#end()

