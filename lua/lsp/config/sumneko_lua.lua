require('lsp.common')

require('lspconfig').sumneko_lua.setup {
  -- https://github.com/neovim/nvim-lspconfig#suggested-configuration
  on_attach = LSP_ON_ATTACH,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },

  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  capabilities = LSP_CLIENT_CAPABILITIES,

  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
