# Omkar's Neovim Configuration

A personal Neovim configuration built on top of NvChad (v2.5), with support for Python, C/C++, Rust, Java, Lua, and web development.

---

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Post-Installation](#post-installation)
- [Key Bindings](#key-bindings)
- [Plugin List](#plugin-list)
- [Directory Structure](#directory-structure)
- [Customization](#customization)
- [Keeping in Sync](#keeping-in-sync)
- [Troubleshooting](#troubleshooting)

---

## Features

- **Theme**: Catppuccin Mocha with custom statusline via Lualine
- **File Navigation**: Neo-tree sidebar + Telescope fuzzy finder with fzf
- **LSP Support**: Pyright, Clangd, Rust Analyzer, Lua LS, Bash LS, JDTLS (Java)
- **Autocompletion**: nvim-cmp with LuaSnip and friendly-snippets
- **Syntax Highlighting**: Treesitter for accurate, fast highlighting
- **Formatting**: Conform.nvim with format-on-save (Black, clang-format, rustfmt, stylua, prettier, shfmt)
- **Debugging**: DAP with UI support for Python, Java, and more
- **Git Integration**: Gitsigns (inline blame, hunk navigation) + LazyGit
- **Diagnostics**: Trouble.nvim for a structured diagnostics panel
- **Quality of Life**: vim-illuminate (highlight references), nvim-surround, smart scrolling

---

## Prerequisites

Ensure the following are installed on your system before proceeding:

| Dependency | Purpose | Install Guide |
|------------|---------|---------------|
| **Neovim >= 0.11** | Editor | [neovim.io](https://github.com/neovim/neovim/releases) |
| **Git** | Plugin management, version control | `sudo apt install git` / `brew install git` |
| **A C Compiler** (gcc/clang) | Required by Treesitter | `sudo apt install build-essential` / `xcode-select --install` |
| **Node.js >= 18** | Required by some LSP servers | [nodejs.org](https://nodejs.org/) |
| **A Nerd Font** | Required for icons to render | [nerdfonts.com](https://www.nerdfonts.com/) |
| **ripgrep** | Used by Telescope live grep | `sudo apt install ripgrep` / `brew install ripgrep` |

### Optional

| Dependency | Purpose |
|------------|---------|
| **Python 3 + pip** | Python LSP and debugger |
| **Rust (cargo)** | Rust Analyzer |
| **Java JDK** | JDTLS for Java development |
| **LazyGit** | Terminal Git UI (`brew install lazygit`) |

---

## Installation

### Linux / macOS / WSL

```bash
# 1. Back up existing Neovim config (if any)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# 2. Clone this repository
git clone https://github.com/ohhmkar/nvim.git ~/.config/nvim

# 3. Launch Neovim
nvim
```

### Windows (PowerShell)

```powershell
# 1. Back up existing config
Rename-Item "$env:LOCALAPPDATA\nvim" "$env:LOCALAPPDATA\nvim.bak" -ErrorAction SilentlyContinue
Rename-Item "$env:LOCALAPPDATA\nvim-data" "$env:LOCALAPPDATA\nvim-data.bak" -ErrorAction SilentlyContinue

# 2. Clone this repository
git clone https://github.com/ohhmkar/nvim.git "$env:LOCALAPPDATA\nvim"

# 3. Launch Neovim
nvim
```

---

## Post-Installation

On first launch, Lazy.nvim will automatically:
1. Bootstrap itself
2. Download and install all plugins
3. Install Treesitter parsers

After plugins are installed:
1. Run `:Mason` to open the Mason UI
2. Verify that all LSP servers and formatters are installed
3. If any are missing, press `i` next to them to install manually

---

## Key Bindings

Leader key: `Space`

### General

| Binding | Mode | Action |
|---------|------|--------|
| `Esc` | Normal | Clear search highlight |
| `Ctrl+s` | Normal | Save file |
| `Space q` | Normal | Close buffer |
| `J` / `K` | Visual | Move selection down / up |
| `Ctrl+d` / `Ctrl+u` | Normal | Scroll half-page (centered) |
| `<` / `>` | Visual | Indent left / right (stays in visual) |
| `Space p` | Visual | Paste without overwriting register |

### Navigation

| Binding | Mode | Action |
|---------|------|--------|
| `Space e` | Normal | Toggle Neo-tree file tree |
| `Space ff` | Normal | Find files (Telescope) |
| `Space fg` | Normal | Live grep (Telescope) |
| `Space fb` | Normal | List buffers (Telescope) |
| `Space fr` | Normal | Recent files (Telescope) |
| `Space fk` | Normal | Show keymaps (Telescope) |
| `Space sv` | Normal | Vertical split |
| `Space sh` | Normal | Horizontal split |

### LSP

| Binding | Mode | Action |
|---------|------|--------|
| `gd` | Normal | Go to definition |
| `gr` | Normal | Find references |
| `K` | Normal | Hover documentation |
| `Space ca` | Normal | Code action |
| `Space rn` | Normal | Rename symbol |
| `Space ld` | Normal | Line diagnostics (floating) |

### Git

| Binding | Mode | Action |
|---------|------|--------|
| `Space gg` | Normal | Open LazyGit |
| `]h` / `[h` | Normal | Next / previous hunk |
| `Space hs` | Normal | Stage hunk |
| `Space hr` | Normal | Reset hunk |
| `Space hb` | Normal | Blame line |
| `Space hd` | Normal | Diff this file |

### Debugging (DAP)

| Binding | Mode | Action |
|---------|------|--------|
| `Space db` | Normal | Toggle breakpoint |
| `Space dc` | Normal | Continue |
| `Space di` | Normal | Step into |
| `Space do` | Normal | Step over |
| `Space dO` | Normal | Step out |
| `Space dt` | Normal | Terminate |
| `Space du` | Normal | Toggle DAP UI |

### Diagnostics (Trouble)

| Binding | Mode | Action |
|---------|------|--------|
| `Space xx` | Normal | Toggle Trouble panel |
| `Space xw` | Normal | Workspace diagnostics |
| `Space xd` | Normal | Document diagnostics |

### Neo-tree File Operations

| Key | Action |
|-----|--------|
| `a` | Create new file or directory (end name with `/` for directory) |
| `d` | Delete file or directory |
| `r` | Rename |
| `c` | Copy |
| `m` | Move |
| `y` | Copy path to clipboard |

---

## Plugin List

| Plugin | Purpose |
|--------|---------|
| `catppuccin/nvim` | Mocha color scheme |
| `nvimdev/dashboard-nvim` | Start screen |
| `neovim/nvim-lspconfig` | LSP configuration |
| `williamboman/mason.nvim` | LSP/formatter installer |
| `hrsh7th/nvim-cmp` | Autocompletion engine |
| `L3MON4D3/LuaSnip` | Snippet engine |
| `nvim-treesitter/nvim-treesitter` | Syntax highlighting |
| `nvim-neo-tree/neo-tree.nvim` | File tree sidebar |
| `nvim-telescope/telescope.nvim` | Fuzzy finder |
| `lewis6991/gitsigns.nvim` | Git signs and blame |
| `kdheepak/lazygit.nvim` | LazyGit integration |
| `mfussenegger/nvim-dap` | Debug Adapter Protocol |
| `rcarriga/nvim-dap-ui` | DAP UI |
| `mfussenegger/nvim-dap-python` | Python debugger |
| `mfussenegger/nvim-jdtls` | Java LSP |
| `stevearc/conform.nvim` | Formatting |
| `folke/trouble.nvim` | Diagnostics panel |
| `RRethy/vim-illuminate` | Highlight word under cursor |
| `kylechui/nvim-surround` | Surround text objects |
| `nvim-lualine/lualine.nvim` | Statusline |

---

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point: bootstraps Lazy.nvim and loads modules
├── .gitignore
├── .stylua.toml              # Lua formatter config
├── LICENSE
├── README.md
└── lua/
    ├── autocmds.lua          # Autocommands
    ├── chadrc.lua            # NvChad UI overrides
    ├── mappings.lua          # All key bindings
    ├── options.lua           # Neovim options (tabs, search, UI, etc.)
    ├── configs/
    │   ├── conform.lua       # Formatter configuration
    │   ├── lazy.lua          # Lazy.nvim settings
    │   └── lspconfig.lua     # LSP server configurations
    └── plugins/
        └── init.lua          # All plugin declarations
```

---

## Customization

- **Add a new plugin**: Edit `lua/plugins/init.lua` and add a new entry to the returned table.
- **Add a key binding**: Edit `lua/mappings.lua`.
- **Change editor options**: Edit `lua/options.lua`.
- **Add/modify LSP servers**: Edit `lua/configs/lspconfig.lua` or add config files under `lua/configs/`.
- **Change formatters**: Edit `lua/configs/conform.lua`.
- **Change the theme**: Modify the Catppuccin setup in `lua/plugins/init.lua` or swap the plugin entirely.

---

## Keeping in Sync

To keep this config synchronized across multiple machines:

```bash
# After making changes on one machine:
cd ~/.config/nvim
git add -A
git commit -m "describe your changes"
git push

# On the other machine:
cd ~/.config/nvim
git pull
```

Restart Neovim after pulling to pick up plugin changes.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Icons not displaying | Install a [Nerd Font](https://www.nerdfonts.com/) and set it as your terminal font |
| LSP server not starting | Run `:Mason` and check if the server is installed. Press `i` to install. |
| Treesitter errors | Run `:TSUpdate` to update parsers |
| Plugin errors on startup | Run `:Lazy sync` to reinstall/update plugins |
| Formatter not working | Check `:ConformInfo` to see which formatters are detected |
| "command not found" errors | Ensure the required CLI tools are on your `$PATH` |

---

*Maintained by Omkar Gajare*
