# nvim config

Personal Neovim configuration built on top of [LazyVim](https://www.lazyvim.org/), focused on Ruby on Rails development.

## Requirements

- Neovim >= 0.9
- [lazy.nvim](https://github.com/folke/lazy.nvim) (bootstrapped automatically)
- Node.js (for LSP servers and formatters)
- Ruby with `ruby-lsp` and `rubocop` gems available in your project bundle

## Installation

This config is part of [sudo_env](https://github.com/jmmalaca/sudo_env). Running `install.sh` will symlink it automatically:

```bash
git clone git@github.com:jmmalaca/sudo_env.git ~/sudo_env
cd ~/sudo_env
./install.sh
```

Or manually:

```bash
ln -sf ~/sudo_env/nvim ~/.config/nvim
```

## Plugins

### Editor

| Plugin | Purpose |
|--------|---------|
| [LazyVim](https://github.com/LazyVim/LazyVim) | Base distribution |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting — includes `embedded_template` for ERB and `endwise` for Ruby auto-end |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting (Prettier, jq, markdownlint, yamlfix) |
| [noice.nvim](https://github.com/folke/noice.nvim) | UI for messages, cmdline, and popupmenu |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [ufo.nvim](https://github.com/kevinhwang91/nvim-ufo) | Better folding |

### LSP

| Plugin | Purpose |
|--------|---------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| `ruby-lsp` | Ruby language server (runs via bundler) |
| `rubocop --lsp` | RuboCop linting via LSP (runs via bundler) |

### Navigation

| Plugin | Purpose |
|--------|---------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File tree |
| [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim) | File browser |

### Appearance

| Plugin | Purpose |
|--------|---------|
| [catppuccin](https://github.com/catppuccin/nvim) | Default colorscheme (Mocha) |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Alternative colorscheme |
| [everforest](https://github.com/sainnhe/everforest) | Alternative colorscheme |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Rendered markdown in buffer |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown preview in browser |
| [image.nvim](https://github.com/3rd/image.nvim) | Image rendering in buffer |

### AI Tools

AI tools are **disabled by default** and must be explicitly enabled per session.

| Plugin | Purpose |
|--------|---------|
| [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) | AI code completions via Claude (blink.cmp) |
| [opencode.nvim](https://github.com/NickvanDyke/opencode.nvim) | AI chat interface |

**Toggle:** `<leader>ox` — enables/disables all AI tools for the current session.

## Key Bindings

| Key | Action |
|-----|--------|
| `<leader>ox` | Toggle AI tools on/off |
| `<leader>oa` | Ask AI about current selection |
| `<leader>os` | Select AI prompt |
| `<leader>ot` | Toggle AI chat panel |
| `<leader>on` | New AI session |
| `<leader>sx` | Resume last search |
