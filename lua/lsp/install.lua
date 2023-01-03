require('lsp.common')

require("mason").setup {}
require("mason-lspconfig").setup { ensure_installed = LANGUAGE_SERVERS }
