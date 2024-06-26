local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_use_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")

  -- Tokyonight theme
  use("folke/tokyonight.nvim")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")

  -- maximizes and restores current window
  use("szw/vim-maximizer")

  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
  })
  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- add, delete, change surroundings (it's awesome)
  use("echasnovski/mini.surround")
  use("tpope/vim-commentary")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("mhinz/vim-signify")
  use("mattn/emmet-vim")
  use("ntpeters/vim-better-whitespace")

  -- Status line
  use("nvim-lualine/lualine.nvim")

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use("onsails/lspkind.nvim") -- vscode like icons for completion

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets")

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  -- formatting & linting
  use("stevearc/conform.nvim")
  use("amadeus/vim-mjml") -- mjml syntax support
  -- PX to REM in styles
  use("Oldenborg/vim-px-to-rem")

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  use("windwp/nvim-autopairs")
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("tpope/vim-fugitive")

  -- Database
  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-ui")

  -- search and replace
  use("yegappan/greplace")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
