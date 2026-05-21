-- Use muon as meson LSP (actively maintained, replaces archived mesonlsp).
-- See: https://muon.build
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = { muon = {} },
  },
}
