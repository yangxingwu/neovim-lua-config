-- refer to https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/
-- extras/lang/clangd.lua#L79-L87 and L95-L101
return {
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
    servers = {
      -- turn off clangd for .proto files
      --
      -- refer to https://github.com/neovim/nvim-lspconfig/blob/master/lua/\
      -- lspconfig/configs/clangd.lua#L53 and https://github.com/LazyVim/\
      -- LazyVim/discussions/3997
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },
    },
  },
}
