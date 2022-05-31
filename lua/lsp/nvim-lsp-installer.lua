local language_servers = require('lsp.language-servers')

require('nvim-lsp-installer').setup {
  ensure_installed = language_servers,
}
