-- Install packer automatically
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Automatically regenerate compiled loader file
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'plugins.lua' })

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

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)
