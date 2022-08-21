require("null-ls").setup {
  sources = {
    require("null-ls").builtins.formatting.shfmt,
    require("null-ls").builtins.code_actions.shellcheck,
  },
}
