-- utf8 encoding
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'utf-8'

-- display line numbers
vim.wo.number = true

-- redefine tab as 4 spaces
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- auto indent
vim.o.autoindent = true
vim.o.smartindent = true

-- auto reload
vim.o.autoread = true
vim.bo.autoread = true

-- highlight current line and column
vim.wo.cursorline = true
vim.wo.cursorcolumn = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
