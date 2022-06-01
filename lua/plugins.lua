local use = require('packer').use

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- gruvbox theme
  use { 'ellisonleao/gruvbox.nvim', requires = 'rktjmp/lush.nvim' }

  -- bufferline
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

  -- Fancier statusline
  use 'nvim-lualine/lualine.nvim'

  -- nvim-tree
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- language server protocol support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- auto completion
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
end)
