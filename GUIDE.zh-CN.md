# Neovim 配置使用指南

## 概述

基于 [LazyVim](https://www.lazyvim.org/) 的个人 Neovim 配置，针对 C/C++、Go、Rust、Python 开发优化。

## 快速开始

1. 将此仓库 clone 到 `~/.config/nvim`
2. 打开 Neovim — 插件自动安装
3. 运行 `:Lazy` 查看插件状态
4. 运行 `:LazyExtras` 管理 extras

## 已启用的 Extras

| Extra | 用途 |
|---|---|
| `editor.illuminate` | 自动高亮光标下符号，`[[`/`]]` 在引用间跳转 |
| `lang.clangd` | C/C++ LSP，含 clang-tidy、头文件自动插入、详细补全 |
| `lang.cmake` | CMake LSP 和语法支持 |
| `lang.docker` | Dockerfile/Compose LSP 和语法 |
| `lang.git` | Git 集成增强 |
| `lang.go` | Go LSP (gopls) 和工具链 |
| `lang.markdown` | Markdown 渲染和预览（linter 已关闭） |
| `lang.python` | Python LSP 和工具链 |
| `lang.rust` | Rust LSP (rust-analyzer) 和工具链 |
| `lang.toml` | TOML LSP，用于 Cargo.toml 和配置文件 |
| `lang.yaml` | YAML LSP 和 schema 支持 |
| `util.dot` | Dotfile 编辑支持（shell、fish 等） |

## 关键定制化说明

### 主题：catppuccin-mocha

覆盖 LazyVim 默认主题（tokyonight）。文件：`lua/plugins/colorscheme.lua`

### Meson：muon LSP

使用 [muon](https://muon.build) 作为 meson 语言服务器（替代已归档的 mesonlsp）。文件：`lua/plugins/meson.lua`

### Markdown：禁用 linter

启用了 `lang.markdown` extra 以获得渲染和预览功能，但关闭了 markdownlint 诊断（太啰嗦）。文件：`lua/plugins/markdown.lua`

## 项目级配置指南

### Linux Kernel + clangd

在 kernel 源码根目录创建 `.clangd` 文件控制 clangd 行为：

```yaml
Index:
  Background: Build  # 只索引编译过的文件（节省内存/CPU）

CompileFlags:
  Add: [--pch-storage=disk]  # 预编译头存磁盘，降低 RAM 占用
```

**如果还卡（macOS 纯浏览场景）：**

```yaml
Index:
  Background: Skip  # 完全不后台索引，只处理当前打开的文件
```

`Skip` 最省资源，代价是"查找引用"只能找到打开过的文件。

**生成 compile_commands.json：**

```bash
# 在内核源码树中（编译后）：
scripts/clang-tools/gen_compile_commands.py

# 只生成某个子系统的（更快）：
scripts/clang-tools/gen_compile_commands.py -d . drivers/net/ net/
```

**注意：** `.clangd` 文件是你自己在本地创建的，不是 kernel 自带的，不要提交到 upstream。

### C/C++ 存量项目的格式化策略

对于格式不规范的老项目，保存时全量格式化会导致 diff 过大。推荐工作流：

**第一步：在编辑器中禁用 autoformat**

在项目根目录创建 `.nvim.lua`：

```lua
-- 禁用此项目的 autoformat
vim.b.autoformat = false
```

Neovim 的 `exrc` 功能（LazyVim 默认开启）会在打开项目时自动加载此文件。

**临时切换：** 按 `<leader>uf` 切换当前 buffer 的 autoformat。

**第二步：提交前只格式化修改的行**

使用 `git-clang-format`（随 clang/LLVM 工具链附带）只格式化你改动的行：

```bash
# 格式化 staged 的修改（commit 前）：
git clang-format

# 预览会改什么（dry-run）：
git clang-format --diff

# 格式化相对于某个 commit 的修改：
git clang-format HEAD~1
```

这样你自己改动的代码是干净的，但不会动文件的其他部分。

**可选：用 pre-commit hook 自动化**

避免忘记手动执行，可以加一个 git hook 在 commit 时自动跑 `git-clang-format`：

```bash
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/sh
# 自动格式化 staged 的修改行
git clang-format --staged --diff --quiet
if [ $? -ne 0 ]; then
    git clang-format --staged
    echo "已格式化 staged 的修改，请检查后重新 stage。"
    exit 1
fi
EOF
chmod +x .git/hooks/pre-commit
```
```

或者使用 [pre-commit](https://pre-commit.com/) 框架，在 `.pre-commit-config.yaml` 中添加：

```yaml
repos:
  - repo: https://github.com/pre-commit/mirrors-clang-format
    rev: v18.1.8
    hooks:
      - id: clang-format
        types_or: [c, c++]
```

**注意：** Go 和 Rust 项目一般不需要此策略——`gofmt` 和 `rustfmt` 从项目诞生起就是标配，存量代码本身就是格式化的。

## 快捷键速查

| 快捷键 | 功能 |
|---|---|
| `<leader>uh` | 切换 inlay hints |
| `<leader>uf` | 切换 autoformat（当前 buffer） |
| `[[` / `]]` | 在光标下符号的引用间跳转（illuminate） |
| `<leader>cp` | 在浏览器中预览 Markdown |
| `<leader>cs` | 文档符号（Trouble） |
| `:LazyExtras` | 管理 LazyVim extras |
| `:Lazy update` | 更新所有插件 |
| `:Lazy profile` | 检查启动性能 |

## 维护指南

### Starter 同步检查

此配置追踪 [LazyVim/starter](https://github.com/LazyVim/starter) 模板。GitHub Action 每月自动检查是否有偏差。

**手动检查：**

```bash
./scripts/check-starter-sync.sh
```

### 插件更新

```bash
# 在 Neovim 中：
:Lazy update

# 然后提交 lock 文件：
git add lazy-lock.json
git commit -m "chore: update plugin versions"
```

## 待讨论/未来优化

- **buf LSP**：Protobuf 语言服务器支持（需要时再配置）
- **智能 autoformat**：基于 `.clang-format` 文件存在性自动判断是否格式化
- **编辑器内只格式化修改行**：conform.nvim [跟踪了此 feature request](https://github.com/stevearc/conform.nvim/issues/92) 但尚未内置；社区方案是 gitsigns hunks + conform range format（约 30 行 Lua）
