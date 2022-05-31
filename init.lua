-- basics
require('basics')

-- install plugins
require('plugins')

-- plugin configs
require('configs.gruvbox')
require('configs.bufferline')
require('configs.nvim_tree')
require('configs.nvim_treesitter')

-- language server protocol support
require('lsp.nvim_lsp_installer')
require('lsp.language_servers_setup')
