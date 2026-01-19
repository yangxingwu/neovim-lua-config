return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- add monokai-pro
  { "loctvl842/monokai-pro.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
