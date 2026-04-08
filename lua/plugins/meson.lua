return {
  -- Use muon as meson LSP (actively maintained, replaces archived mesonlsp)
  "neovim/nvim-lspconfig",
  opts = {
    servers = { muon = {} },
  },
}
