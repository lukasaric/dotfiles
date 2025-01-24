return {
  init_options = {
    vue = {
      hybridMode = false,
    },
    typescript = {
      tsdk = vim.fn.expand(
        "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
      ),
    }
  },
}
