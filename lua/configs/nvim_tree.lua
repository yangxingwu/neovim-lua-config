require('nvim-tree').setup {
  filters = {
    custom = {
      "^.git$", -- hide the .git folder
    },
  },
}
