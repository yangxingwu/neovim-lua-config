return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      custom_filter = function(buf_number)
        if vim.bo[buf_number].buftype == "quickfix" then
          return false
        end
        return true
      end,
    },
  },
}
