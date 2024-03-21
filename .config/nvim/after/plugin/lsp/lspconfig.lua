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

local lsp_restart = function()
  vim.diagnostic.reset()
  vim.cmd("LspRestart")
  print("LSP restarted")
end

vim.keymap.set('n', '<leader>lr', lsp_restart)
vim.keymap.set('n', '<leader>m', '<cmd>Mason<cr>', { silent = true })
vim.keymap.set('n', '<leader>N', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>,', vim.diagnostic.setloclist)

-- enable keybinds only for when lsp server available
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local buffer = ev.buf
   	-- keybind options
    local opts = { noremap = true, silent = true, buffer = buffer }
    -- set keybinds
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    keymap.set("n", "<Leader>k", vim.lsp.buf.hover, opts)
    keymap.set("n", "<Leader>K", vim.lsp.buf.signature_help, opts)
    keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
    keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end,
})

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- setup lsp servers
for _, server in ipairs(servers) do
	local opts = {  capabilities = capabilities }
	local has_custom_opts, server_custom_opts = pcall(require, "lsaric.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
 end
