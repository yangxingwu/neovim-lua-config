require('lsp.common')

-- Mappings
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', LSP_KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', LSP_KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', LSP_KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', LSP_KEYMAP_OPTS)

-- Use a loop to conveniently call 'setup' on multiple servers
for _, lsp in pairs(LANGUAGE_SERVERS) do
  require('lsp/config/' .. lsp)
end
