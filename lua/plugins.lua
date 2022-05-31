local use = require('packer').use

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- gruvbox theme
  use {
    'ellisonleao/gruvbox.nvim',
    requires = 'rktjmp/lush.nvim'
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- language server protocol support
  use {
    'neovim/nvim-lspconfig',
    "williamboman/nvim-lsp-installer"
  }
end)
