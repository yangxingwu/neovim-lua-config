require('nvim-tree').setup {
  open_on_setup = true,
  open_on_setup_file = true,
  filters = {
    custom = {
      "^.git$", -- hide the .git folder
    },
  },
}
