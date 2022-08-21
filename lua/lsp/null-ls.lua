require("null-ls").setup {
  sources = {
    -- for bash
    require("null-ls").builtins.formatting.shfmt,
    require("null-ls").builtins.code_actions.shellcheck,

    -- for python
    require("null-ls").builtins.formatting.isort,
    require("null-ls").builtins.formatting.black.with {
      extra_args = { "--line-length", "79" },
    },
    require("null-ls").builtins.diagnostics.flake8,
  },
}
