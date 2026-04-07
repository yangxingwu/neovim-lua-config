return {
  "neovim/nvim-lspconfig",
  -- enable meson lsp
  opts = {
    servers = { mesonlsp = {} },
  },
}
