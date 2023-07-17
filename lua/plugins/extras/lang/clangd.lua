return {
  {
    -- disable background-index for clangd 🚀
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.cmd = {
            "clangd",
            "--background-index=false",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          }
        end,
      },
    },
  },
}
