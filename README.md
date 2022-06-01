# neovim-lua-config

This repo is meant to be used as a starting point for my own configuration. Inspired by [learn-neovim-lua](https://github.com/nshen/learn-neovim-lua/tree/bak/docs) and [nvim-lua/kickstart.vim](https://github.com/nvim-lua/kickstart.nvim).

## clangd for linux kernel

refer to [b30204640192234d18f9168f19f9cd693485b86d](https://github.com/torvalds/linux/commit/b30204640192234d18f9168f19f9cd693485b86d):

> Note that while `gen_compile_commands.py` enables the use of clang-based tools, it does not require the kernel to be compiled with clang. E.g., the following sequence of commands produces a compile_commands.json file that works correctly with LibTooling.

```bash
$ make defconfig
$ make
$ scripts/gen_compile_commands.py
```
