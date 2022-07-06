require('nvim-treesitter.configs').setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "bash",
    "vim",
    "lua",
    "c",
    "cpp",
    "go",
    "python",
    "make",
    "cmake",
    "markdown",
    "rst",
    "json"
  },

  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  }
}
