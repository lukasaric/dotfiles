local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local servers = require("lsaric.lsp.servers")

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  keymap.set("n", "<Leader>k", vim.lsp.buf.hover, opts)
  keymap.set("n", "<Leader>K", vim.lsp.buf.signature_help, opts)
  keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
  keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
  keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- setup lsp servers
for _, server in ipairs(servers) do
  local opts = { on_attach = on_attach, capabilities = capabilities }
  local has_custom_opts, server_custom_opts = pcall(require, "lsaric.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
