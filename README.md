# sudo_env

My personal dotfiles — everything needed to set up a new macOS machine the way I like it.

## What's in here

| Folder | Purpose |
|---|---|
| `zsh/` | Zsh shell config, aliases, and utility functions |
| `nvim/` | Neovim config (LazyVim-based) |
| `git/` | Git config, global gitignore, commit template |
| `atuin/` | Atuin shell history config |
| `yazi/` | Yazi terminal file manager config |
| `claude/` | Claude Code hooks, agents, and token-saving log |
| `brew/` | Brewfile with all packages and apps |
| `background/` | Desktop wallpaper |
| `macos/` | macOS system defaults script |

## Installation

Clone the repo and run the install script:

```bash
git clone https://github.com/jmmalaca/sudo_env.git ~/sudo_env
cd ~/sudo_env
./install.sh
```

The script will:
1. Install Xcode Command Line Tools (if needed)
2. Install Homebrew and run `brew bundle`
3. Install Oh My Zsh and its plugins (zsh-autosuggestions, zsh-syntax-highlighting)
4. Install nvm and git-fuzzy
5. Symlink all config files to their expected locations
6. Optionally apply macOS system defaults

> **Warning:** Review the scripts before running, especially `macos/setup.sh` — it changes system-level defaults.

## After installation

A few manual steps are always needed on a new machine:

**Git config:** `~/.gitconfig` is a symlink to the tracked `git/.gitconfig`. Your name, email and anything else specific to one machine (like credential helpers) go in `~/.gitconfig.local`, which isn't tracked. `install.sh` creates it with placeholders:
```bash
# edit ~/.gitconfig.local and replace YOUR_NAME / YOUR_EMAIL
git config --file ~/.gitconfig.local user.email "you@example.com"   # machine-only settings go here
```

**API keys** — if any tool requires an API key, store it in the macOS Keychain or a secrets manager. Never put keys in plain text files like `~/.zshrc`.

**Atuin** — log in to sync your shell history:
```bash
atuin login
atuin sync
```

**Ruby** — install and set a version:
```bash
rbenv install 3.3.7
rbenv global 3.3.7
```

**Node** — install a version:
```bash
nvm install --lts
```

## Neovim

The `nvim/` folder contains the full Neovim config (LazyVim-based). On a new machine it's symlinked to `~/.config/nvim/`. Plugins are managed by lazy.nvim and will be installed automatically on first launch.

## macOS defaults

The `macos/setup.sh` script configures sensible macOS defaults — Finder, Dock, keyboard, trackpad, screenshots, Safari, and more. Run it manually if you skipped it during install:

```bash
./macos/setup.sh
```

## Shell

- **Shell:** Zsh with Oh My Zsh
- **Theme:** Jonathan
- **Plugins:** git, ruby, rails, zsh-autosuggestions, zsh-syntax-highlighting
- **History:** Atuin (synced across machines)
- **Aliases:** `~/.aliases` — navigation, git, services (pg, mysql, redis, docker), and more
- **Functions:** `~/.functions` — `mkd`, `v`, `o`, `server`, `json`, `calc`, `fs`, `gz`, `getcertnames`, and more

## Claude Code

Hooks and agents shared by both Claude Code profiles, plus a log of token-saving changes. See [`claude/README.md`](claude/README.md).

## Git

- **Pager:** diff-so-fancy
- **Fuzzy branch checkout:** `git b` (powered by fzf)
- **Key aliases:** `s` (status), `lg` (log graph), `co` (checkout), `please` (force-with-lease), `dm` (delete merged branches)
- **Commit template:** Motivation / Modifications / Result sections
- **Global `commit-msg` hook:** `git/hooks/commit-msg`, symlinked into `~/.git-hooks/` and enabled with `core.hooksPath`. Strips Claude attribution trailers (`Co-Authored-By: Claude`, `Claude-Session:`, "Generated with Claude Code") from every commit. Because a global `core.hooksPath` turns off each repo's `.git/hooks/`, the hook hands off to the repo's own `commit-msg` if there is one. Other hook types (`pre-commit`, `pre-push`) need the same pass-through before a repo can rely on them. Undo with `git config --global --unset core.hooksPath`.
