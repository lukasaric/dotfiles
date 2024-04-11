local null_ls = require("null-ls")

local utils = require("null-ls.utils")
local cmd_resolver = require("null-ls.helpers.command_resolver")

local formatter_settings_map = {
  prettier = {
    runtime_condition = function(params)
      local flag = cmd_resolver.from_node_modules()(params)
      if flag then
        return true
      end
      return false
    end,
  },
  stylua = {},
  yamlfix = {},
}

local get_source = function(type, name)
  local none_ls_source = "none-ls." .. type .. "." .. name
  local success_lsp_config, _ = pcall(require, none_ls_source)
  if success_lsp_config then
    return require(none_ls_source)
  end
  if null_ls.builtins[type] and null_ls.builtins[type][name] then
    return null_ls.builtins[type][name]
  end
end

-- null-ls setup
local sources = {}
-- formatters
for formatter, config in pairs(formatter_settings_map) do
  local source = get_source("formatting", formatter)
  if source then
    table.insert(sources, source.with(config))
  end
end

-- format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

null_ls.setup({
  on_attach = on_attach,
  sources = sources,
  root_dir = utils.root_pattern(".null-ls-root", "Makefile", "package.json", ".git"),
})
