local setup, conform = pcall(require, "conform")
if not setup then
  return
end

conform.setup({
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = true,
    timeout_ms = 500,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "fixjson" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    vue = { "prettier" },
    yaml = { "yamlfix" },
  },
})
