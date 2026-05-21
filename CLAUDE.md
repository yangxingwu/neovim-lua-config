# Project Context

Personal Neovim configuration, used as primary daily IDE.

## Origin

Based on [LazyVim/starter](https://github.com/LazyVim/starter) template.
Scaffold files (init.lua, lua/config/lazy.lua, stylua.toml, .neoconf.json)
should remain in sync with upstream starter.

## Checking Starter Sync

To compare with the latest starter:

    git clone --depth 1 https://github.com/LazyVim/starter.git /tmp/lazyvim-starter
    diff /tmp/lazyvim-starter/init.lua init.lua
    diff /tmp/lazyvim-starter/lua/config/lazy.lua lua/config/lazy.lua
    diff /tmp/lazyvim-starter/.gitignore .gitignore
    diff /tmp/lazyvim-starter/stylua.toml stylua.toml
    diff /tmp/lazyvim-starter/.neoconf.json .neoconf.json
    rm -rf /tmp/lazyvim-starter

The starter rarely changes. Check quarterly or when LazyVim announces breaking changes.

## Architecture

- `lua/config/` - Standard LazyVim config (options, keymaps, autocmds)
- `lua/plugins/` - Custom plugin overrides and additions
- `lazyvim.json` - Declarative extras management (managed via :LazyExtras)
- `lazy-lock.json` - Plugin version lock (commit after :Lazy update)

## Key Customizations

- clangd: background-index disabled, .proto excluded from filetypes
- meson: muon as LSP
- bufferline: quickfix buffer hidden
- autocmds: autoformat disabled for C/C++
- colorscheme: catppuccin-mocha

## Documentation References

- LazyVim distro: https://www.lazyvim.org/
- lazy.nvim plugin manager: https://lazy.folke.io/
- Use lazyvim.org for 90% of tasks (extras, keymaps, plugin config)
- Use lazy.folke.io only for lazy.nvim internals (performance, loader behavior)
