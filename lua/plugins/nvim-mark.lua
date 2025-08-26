return {
  "yangxingwu/nvim-mark.lua",
  lazy = false,

  config = function()
    require("mark").setup()
    require("mark").autocmds()

    -- -- Toggle mark for word under cursor or visual selection (same key for mark/unmark)
    vim.keymap.set("n", "<leader>m", "<Plug>MarkWord", { desc = "Toggle mark for word under cursor" })
    vim.keymap.set("v", "<leader>m", "<Plug>MarkVisual", { desc = "Toggle mark for word under cursor" })

    -- Additional useful mappings:
    vim.keymap.set("n", "<leader>mc", ":Mark clear<CR>", { desc = "Clear all marks" })
    vim.keymap.set("n", "<leader>ml", ":Mark list<CR>", { desc = "List all marks" })
    vim.keymap.set("n", "<leader>mn", ":Mark add ", { desc = "Add new mark pattern" })
  end,
}
