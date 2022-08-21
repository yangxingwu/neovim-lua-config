require("null-ls").setup {
  sources = {
    -- for bash
    require("null-ls").builtins.formatting.shfmt,
    require("null-ls").builtins.code_actions.shellcheck,

    -- for python
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.diagnostics.flake8,
  },
}
