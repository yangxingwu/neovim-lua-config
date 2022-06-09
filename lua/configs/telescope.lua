require('telescope').setup {
  defaults = {
    -- where {mode} is the one character letter for a mode
    -- ('i' for insert, 'n' for normal).
    -- check lua/telescope/mappings.lua for more details
    mappings = {
      i = {
        -- ['<C-u>'] = false,
        -- ['<C-d>'] = false,
      },
    },
  },
}

-- get fzf loaded and working with telescope
require('telescope').load_extension('fzf')

-- add leader shortcuts
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, opts)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, opts)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, opts)
