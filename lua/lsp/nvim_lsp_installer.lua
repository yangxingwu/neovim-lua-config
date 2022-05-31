local language_servers = require('lsp.language_servers')

require('nvim-lsp-installer').setup {
  ensure_installed = language_servers,
}
