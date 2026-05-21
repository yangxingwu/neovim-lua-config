-- Disable markdownlint diagnostics (too noisy for daily use).
-- Keep render-markdown and preview functionality from lang.markdown extra.
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
}
