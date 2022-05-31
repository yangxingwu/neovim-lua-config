local language_servers = require('lsp.language-servers')

for _, lsp in ipairs(language_servers) do
  require('lsp/' .. lsp)
end
