require('lsp.common')

require('lspconfig').jedi_language_server.setup {
  -- https://github.com/neovim/nvim-lspconfig#suggested-configuration
  on_attach = LSP_ON_ATTACH,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
}
