return {
  "MagicDuck/grug-far.nvim",
  opts = {
    -- Default search & replace engine, switched to ast-grep (structural matching).
    -- Valid values: 'ripgrep' | 'astgrep' | 'astgrep-rules'
    -- Press <localleader>e inside the grug-far window to cycle engines temporarily.
    engine = "astgrep",
  },
}
