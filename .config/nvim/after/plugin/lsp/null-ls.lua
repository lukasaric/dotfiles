local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local utils = require("null-ls.utils")
local helpers = require("null-ls.helpers")

-- formatter settings: { <formatter name> : config }
local cwdFn = helpers.cache.by_bufnr(function(params)
  return utils.root_pattern("package.json")(params.bufname)
end)

null_ls.setup({
  -- setup formatters & linters
  sources = {
    --  to disable file types use
    formatting.prettier,
    formatting.stylua, -- lua formatter
    formatting.stylelint.with({ cwd = cwdFn }), -- style formatter
    diagnostics.stylelint.with({ cwd = cwdFn }),
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
