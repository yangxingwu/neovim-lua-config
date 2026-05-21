# Project Context

Personal Neovim configuration, used as primary daily IDE.

## Origin

Based on [LazyVim/starter](https://github.com/LazyVim/starter) template.
Scaffold files (init.lua, lua/config/lazy.lua, stylua.toml, .neoconf.json)
should remain in sync with upstream starter.

## Checking Starter Sync

Automated: GitHub Action runs monthly, creates an issue if drift detected.

Manual:

    ./scripts/check-starter-sync.sh

## Architecture

- `lua/config/` - Standard LazyVim config (options, keymaps, autocmds)
- `lua/plugins/` - Custom plugin overrides and additions
- `lazyvim.json` - Declarative extras management (managed via :LazyExtras)
- `lazy-lock.json` - Plugin version lock (commit after :Lazy update)

## Key Customizations

- meson: muon as LSP (lua/plugins/meson.lua)
- colorscheme: catppuccin-mocha (lua/plugins/colorscheme.lua)
- markdown: lang.markdown extra enabled, markdownlint disabled (lua/plugins/markdown.lua)

## Per-Project Configuration

- Large C/C++ projects: use .clangd file for Index/Background settings
- Legacy projects: use .nvim.lua with vim.b.autoformat = false
- See GUIDE.md / GUIDE.zh-CN.md for detailed instructions

## Documentation References

- LazyVim distro: https://www.lazyvim.org/
- lazy.nvim plugin manager: https://lazy.folke.io/
- Use lazyvim.org for 90% of tasks (extras, keymaps, plugin config)
- Use lazy.folke.io only for lazy.nvim internals (performance, loader behavior)
