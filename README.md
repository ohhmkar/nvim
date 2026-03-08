<h1 align="center">⚡ omkar's nvim</h1>

<p align="center">
  <i>btw, I use neovim.</i><br>
  <code>built different. runs different. 👾</code>
</p>

---

## 🎯 What's Inside

| Category | Plugins |
|----------|---------|
| 🎨 Theme | Catppuccin Mocha |
| 📁 File Tree | Neo-tree |
| 🔭 Fuzzy Finder | Telescope + fzf |
| 🧠 LSP | Pyright, Clangd, Rust Analyzer, Lua LS, Bash LS |
| ✨ Completion | nvim-cmp + LuaSnip |
| 🎄 Treesitter | Syntax highlighting that actually works |
| 🐛 Debugger | DAP (Python, Java, and more) |
| 🔧 Formatting | Conform.nvim (format on save) |
| 🔀 Git | Gitsigns + LazyGit |
| 💅 Statusline | Lualine |
| 🫧 QoL | Trouble, Illuminate, Surround |

## 🚀 Install

```bash
# back up your old config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# clone this bad boy
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

# launch and let lazy do its thing
nvim
```

> First launch will auto-install everything. Grab some ☕ and wait.

## ⌨️ Key Bindings Cheatsheet

Leader key = `Space`

| Keys | What it does |
|------|-------------|
| `Space e` | Toggle file tree |
| `Space ff` | Find files |
| `Space fg` | Live grep |
| `Space fr` | Recent files |
| `Space gg` | LazyGit |
| `Space ca` | Code action |
| `Space rn` | Rename symbol |
| `gd` | Go to definition |
| `K` | Hover docs |
| `Space db` | Toggle breakpoint |
| `Space dc` | Debug continue |
| `Space xx` | Toggle Trouble diagnostics |

## 📋 Requirements

- Neovim ≥ 0.11
- Git
- A Nerd Font (for the icons)
- Node.js (for some LSPs)
- A C compiler (for treesitter)

## 🧑‍💻 Made By

**Omkar Gajare** — *because VS Code was too mainstream* 😎

---

<p align="center">
  <sub>if it breaks, just <code>:qa!</code> and pretend nothing happened</sub>
</p>
