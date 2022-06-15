LANGUAGE_SERVERS = {
  'bashls', -- bash
  'sumneko_lua', -- lua
  'clangd', -- c & cpp
  'gopls', -- golang
  'jedi_language_server', -- python
  'rust_analyzer', -- rust
  -- 'ccls', -- c & cpp
}

-- Mappings
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
LSP_KEYMAP_OPTS = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
LSP_ON_ATTACH = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', LSP_KEYMAP_OPTS)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', LSP_KEYMAP_OPTS)
end

-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
-- Add additional capabilities supported by nvim-cmp
LSP_CLIENT_CAPABILITIES = vim.lsp.protocol.make_client_capabilities()
LSP_CLIENT_CAPABILITIES = require('cmp_nvim_lsp').update_capabilities(LSP_CLIENT_CAPABILITIES)
