-- Automatically regenerate compiled loader file
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'plugins.lua' })

local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'                                                          -- Package manager
  use { 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } }                 -- gruvbox theme
  use { 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }      -- A snazzy buffer line
  use 'nvim-lualine/lualine.nvim'                                                       -- Fancier statusline
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }     -- File Explorer
  use 'nvim-treesitter/nvim-treesitter'                                                 -- Highlight, edit, and navigate code
  use 'neovim/nvim-lspconfig'                                                           -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'                                                 -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }                     -- Autocompletion
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                 -- Snippet Engine and Snippet Expansion
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }                 -- Add git related info in the signs columns and popups
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }           -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }                      -- Fuzzy Finder Algorithm
  use 'lukas-reineke/indent-blankline.nvim'                                             -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                                -- Detect tabstop and shiftwidth automatically
end)
