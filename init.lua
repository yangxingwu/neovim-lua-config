-- basics
require('basics')

-- install plugins
require('plugins')

-- keybindings
require('keymappings')

-- plugin configs
require('configs.colorscheme')
require('configs.bufferline')
require('configs.lualine')
require('configs.nvim_tree')
require('configs.nvim_treesitter')
require('configs.gitsigns')
require('configs.telescope')
require('configs.indent-blankline')
require('configs.symbols-outline')

-- language server protocol support
require('lsp.install')
require('lsp.setup')
require('lsp.null-ls')

-- auto completion and snippets
require('cmp_and_snip')
