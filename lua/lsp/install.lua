require('lsp.common')

require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}
require("mason-lspconfig").setup {
  ensure_installed = LANGUAGE_SERVERS,
}
