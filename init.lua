-- basics
require('basics')

-- install plugins
require('plugins')

-- plugin configs
require('configs.gruvbox')
require('configs.bufferline')
require('configs.lualine')
require('configs.nvim_tree')
require('configs.nvim_treesitter')

-- language server protocol support
require('lsp.install')
require('lsp.setup')

-- auto completion and snippets
require('cmp_and_snip')
