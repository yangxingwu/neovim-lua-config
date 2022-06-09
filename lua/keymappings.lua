-- refer to https://neovim.io/doc/user/api.html#nvim_set_keymap()
--
-- nvim_set_keymap({mode}, {lhs}, {rhs}, {*opts})
-- Sets a global |mapping| for the given mode. Map the key sequence {lhs} to
-- {rhs} for the modes where the map command applies
--   Parameters:
--     {mode}  Mode short-name
--       'i' - insert mode
--       'n' - normal mode
--       'v' - visual mode
--     {lhs}   Left-hand-side |{lhs}| of the mapping
--     {rhs}   Right-hand-side |{rhs}| of the mapping
--     {opts}  Optional parameters map
--       silent: do NOT echo a mapping on the command line

-- https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
--
-- remap is an option that makes mappings work recursively. By default it is
-- on and I'd recommend you leave it that way. The rest are mapping commands,
-- described below: :map and :noremap are recursive and non-recursive versions
-- of the various mapping commands.

-- remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
