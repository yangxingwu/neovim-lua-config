-- Disable markdownlint diagnostics (too noisy for daily use).
-- Disable spell check for markdown (flags CJK characters as misspelled).
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
