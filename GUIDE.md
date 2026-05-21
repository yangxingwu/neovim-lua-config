# Neovim Configuration Guide

## Overview

Personal Neovim configuration based on [LazyVim](https://www.lazyvim.org/) with customizations for C/C++, Go, Rust, and Python development.

## Quick Start

1. Clone this repo to `~/.config/nvim`
2. Open Neovim — plugins install automatically
3. Run `:Lazy` to check plugin status
4. Run `:LazyExtras` to manage extras

## Enabled Extras

| Extra | Purpose |
|---|---|
| `editor.illuminate` | Auto-highlight symbol under cursor, `[[`/`]]` to jump between references |
| `lang.clangd` | C/C++ LSP with clang-tidy, header insertion, detailed completion |
| `lang.cmake` | CMake LSP and syntax support |
| `lang.docker` | Dockerfile/Compose LSP and syntax |
| `lang.git` | Git integration enhancements |
| `lang.go` | Go LSP (gopls) and tooling |
| `lang.markdown` | Markdown rendering and preview (linter disabled) |
| `lang.python` | Python LSP and tooling |
| `lang.rust` | Rust LSP (rust-analyzer) and tooling |
| `lang.toml` | TOML LSP for Cargo.toml and config files |
| `lang.yaml` | YAML LSP and schema support |
| `util.dot` | Dotfile editing support (shell, fish, etc.) |

## Key Customizations

### Colorscheme: catppuccin-mocha

Overrides LazyVim default (tokyonight). File: `lua/plugins/colorscheme.lua`

### Meson: muon LSP

Uses [muon](https://muon.build) as meson language server (replaces archived mesonlsp). File: `lua/plugins/meson.lua`

### Markdown: linter disabled

The `lang.markdown` extra is enabled for rendering and preview, but markdownlint diagnostics are disabled (too noisy). File: `lua/plugins/markdown.lua`

## Per-Project Configuration

### Linux Kernel + clangd

Create a `.clangd` file in the kernel source root to control clangd behavior:

```yaml
Index:
  Background: Build  # Only index compiled files (saves memory/CPU)

CompileFlags:
  Add: [--pch-storage=disk]  # Store PCH on disk to reduce RAM usage
```

**If still too slow (macOS read-only browsing):**

```yaml
Index:
  Background: Skip  # No background indexing, only process open files
```

`Skip` uses minimal resources. Tradeoff: "find references" only works for files you've opened.

**Generate compile_commands.json:**

```bash
# In the kernel source tree (after building):
scripts/clang-tools/gen_compile_commands.py

# Only generate for a subsystem (faster):
scripts/clang-tools/gen_compile_commands.py -d . drivers/net/ net/
```

**Note:** The `.clangd` file is created locally by you, not part of upstream kernel. Don't commit it upstream.

### Disabling Autoformat Per Project

For legacy projects with inconsistent formatting, create `.nvim.lua` in the project root:

```lua
-- Disable autoformat for this project
vim.b.autoformat = false
```

Neovim's `exrc` feature (enabled by LazyVim) loads this file automatically.

**Temporary toggle:** Press `<leader>uf` to toggle autoformat for the current buffer.

## Key Shortcuts

| Shortcut | Action |
|---|---|
| `<leader>uh` | Toggle inlay hints |
| `<leader>uf` | Toggle autoformat (current buffer) |
| `[[` / `]]` | Jump between references of symbol under cursor (illuminate) |
| `<leader>cp` | Markdown preview in browser |
| `<leader>cs` | Document symbols (Trouble) |
| `:LazyExtras` | Manage LazyVim extras |
| `:Lazy update` | Update all plugins |
| `:Lazy profile` | Check startup performance |

## Maintenance

### Starter Sync Check

This config tracks the [LazyVim/starter](https://github.com/LazyVim/starter) template. A GitHub Action runs monthly to detect drift.

**Manual check:**

```bash
./scripts/check-starter-sync.sh
```

### Plugin Updates

```bash
# In Neovim:
:Lazy update

# Then commit the lock file:
git add lazy-lock.json
git commit -m "chore: update plugin versions"
```

## Future Improvements

- **buf LSP**: Protobuf language server support (when needed)
- **Smart autoformat**: Auto-detect based on `.clang-format` presence
- **Format changed lines only**: Integration with `git-clang-format`
