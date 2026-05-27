# Neovim Configuration Guide

This guide serves as a reference for your custom Neovim environment, built on NvChad and managed via `lazy.nvim`.

## Core Architecture
* **Theme:** Catppuccin (Mocha)
* **Plugin Manager:** lazy.nvim
* **LSP Management:** Mason
* **Dashboard:** dashboard-nvim (Doom theme)
* **File Explorer:** Neotree

---

## Keybindings Reference
**Leader Key:** `Space`

### General Navigation & Editing
| Keymap | Action |
|--------|--------|
| `<Esc>` | Clear search highlight |
| `<C-s>` | Save file |
| `<leader>q` | Close buffer |
| `<C-d>` / `<C-u>` | Scroll down / up (centered) |
| `n` / `N` | Next / Prev search (centered) |
| `J` / `K` | Move selection down / up (visual mode) |
| `<` / `>` | Indent left / right (visual mode) |
| `<leader>p` | Paste over without overwriting register (visual mode) |

### Window Management
| Keymap | Action |
|--------|--------|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |

### File & Workspace Navigation
| Keymap | Action |
|--------|--------|
| `<leader>e` | Toggle Neotree |
| `<leader>ff`| Telescope: Find files |
| `<leader>fg`| Telescope: Live grep (text search) |
| `<leader>fb`| Telescope: Buffer search |
| `<leader>fr`| Telescope: Recent files |
| `<leader>fk`| Telescope: Search keybindings |

### Language Server Protocol (LSP)
| Keymap | Action |
|--------|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Open Code Actions |
| `<leader>rn` | Rename symbol |
| `<leader>ld` | View line diagnostics |

### Debugging (DAP)
| Keymap | Action |
|--------|--------|
| `<leader>db`| Toggle breakpoint |
| `<leader>dc`| Continue execution |
| `<leader>di`| Step into |
| `<leader>do`| Step over |
| `<leader>dO`| Step out |
| `<leader>dt`| Terminate debug session |
| `<leader>du`| Toggle DAP interface |

### Version Control (Git)
| Keymap | Action |
|--------|--------|
| `<leader>gg`| Open LazyGit interface |
| `]h` / `[h` | Jump to next / previous hunk |
| `<leader>hs`| Stage current hunk |
| `<leader>hr`| Reset current hunk |
| `<leader>hb`| View line blame |
| `<leader>hd`| View file diff |

### Diagnostics (Trouble)
| Keymap | Action |
|--------|--------|
| `<leader>xx`| Toggle Trouble panel |
| `<leader>xw`| View workspace diagnostics |
| `<leader>xd`| View document diagnostics |

---

## Language Support
The environment is pre-configured with the following Language Servers (via Mason):
* C/C++ (`clangd`)
* Python (`pyright`)
* Rust (`rust_analyzer`)
* Go (`gopls`)
* Bash (`bashls`)
* Lua (`lua_ls`)

Treesitter parsing is enabled for the above, plus Java, YAML, TOML, JSON, and Markdown.

## Custom Commands
* `:Omkar` - Launches the custom dashboard and displays module load times.
* `:Lazy` - Opens the Lazy.nvim package manager UI.
* `:Mason` - Opens the Mason UI to manage LSPs, formatters, and linters.