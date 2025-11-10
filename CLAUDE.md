# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.
```

## Project Overview

This is a [LazyVim](https://github.com/LazyVim/LazyVim) configuration for Neovim, a highly customized development environment focused on modern web development workflows.

### Purpose
- A complete Neovim IDE configuration optimized for TypeScript, Vue, Tailwind CSS, and web development
- Integrates ESLint for both linting and formatting
- Uses vscode colorscheme with transparency
- Includes Git diff tooling via diffview

## Development Commands & Workflow

### Managing Plugins
- **Update plugins**: Open Neovim and run `:Lazy` to open the plugin manager
- **Check for updates**: `:Lazy` → `Check` (or run `:Lazy sync` to update all plugins)
- **Install new plugins**: Add to `lua/plugins/*.lua` and run `:Lazy` → `Install`
- **Clean unused plugins**: `:Lazy` → `Clean`

### LSP & Diagnostics
- **View LSP status**: `:LspInfo`
- **Restart LSP servers**: `:LspRestart`
- **Format document**: `gb` (typical LazyVim format key)
- **Open diagnostic panel**: `gl` (LazyVim default)

### Git Operations
- **Open diff (working tree)**: `<leader>gd` → Opens Diffview
- **Open diff (last commit)**: `<leader>gD`
- **Open file history**: `<leader>gs`
- **Open current file history**: `<leader>go`
- **Close diffview**: `<leader>gq`
- **Compare against main**: `<leader>gm`

### File Explorer
- **Toggle Neo-tree**: `<leader>e` or `<leader>o` (typical LazyVim shortcuts)
- Neo-tree is configured to open on the **right side** (customization in `lua/plugins/neo-tree.lua`)

### Code Navigation
- **Fuzzy finder**: `<leader>ff` (FZF)
- **Buffers**: `<leader>fb`
- **Recent files**: `<leader>fr`
- **Git hunks**: `<leader>gj` / `<leader>gk`
- **Yanky (paste history)**: `yank` ring is integrated

## Architecture

### Configuration Structure
```
lua/
├── config/              # Core LazyVim configuration files
│   ├── lazy.lua         # Plugin manager setup (LazyVim + extras)
│   ├── options.lua      # Neovim options
│   ├── keymaps.lua      # Custom keymaps
│   └── autocmds.lua     # Autocommands
└── plugins/             # Custom plugin configurations
    ├── colorscheme.lua  # vscode colorscheme with transparency
    ├── lsp.lua          # ESLint + TypeScript LSP configuration
    ├── neo-tree.lua     # File explorer positioning
    └── diffview.lua     # Git diff tool keymaps
```

### Plugin Manager
- Uses [lazy.nvim](https://github.com/folke/lazy.nvim)
- Configuration in `lua/config/lazy.lua`
- **Extras enabled** (from `lazyvim.json`):
  - AI: Copilot integration
  - Coding: Yanky (yank/paste history)
  - Editor: FZF, Neo-tree
  - Languages: TypeScript, Vue, Tailwind CSS
  - Linting: ESLint (both linting & formatting)
  - UI: Mini-animate
  - Utilities: Dotfiles, Mini-hipatterns

### LSP Configuration
- **ESLint**: Configured as both linter and formatter (no conflict with TypeScript server)
- **TypeScript (tsserver)**: Has formatting disabled to avoid conflicts with ESLint
- Configuration details in `lua/plugins/lsp.lua:16-30`

### Colorscheme
- **Theme**: vscode.nvim (Mofiqul/vscode.nvim)
- **Features**: Dark background, transparency, italic comments, terminal colors
- Configuration in `lua/plugins/colorscheme.lua`

## Key Customizations

### ESLint as Primary Formatter
- ESLint handles both linting and document formatting
- TypeScript server has formatting capability disabled to prevent conflicts
- See `lua/plugins/lsp.lua:17-28` for implementation

### File Explorer Position
- Neo-tree opens on the **right side** (non-default)
- Customization in `lua/plugins/neo-tree.lua:4-8`

### Git Diff Tool
- Replaces vim-fugitive with diffview.nvim
- Keybindings replace standard git diff shortcuts
- Full configuration in `lua/plugins/diffview.lua:8-27`

## Code Style & Formatting

### Lua Formatting
- **Formatter**: stylua
- **Configuration**: `.stylua.toml`
  - 2-space indentation
  - 120-column width
  - Spaces (not tabs)

### TypeScript/JavaScript Formatting
- **ESLint** handles all formatting and linting
- No Prettier or other formatters configured
- ESLint server is the primary formatter in LSP setup

## Important Files

| File | Purpose |
|------|---------|
| `init.lua` | Entry point; bootstraps lazy.nvim and loads configuration |
| `lua/config/lazy.lua` | LazyVim plugin manager setup with extras |
| `lazyvim.json` | Lists enabled LazyVim extras |
| `lua/plugins/lsp.lua` | ESLint + TypeScript server configuration |
| `lua/plugins/colorscheme.lua` | vscode theme with transparency |
| `lua/plugins/diffview.lua` | Git diff tool keymaps and setup |
| `lua/plugins/neo-tree.lua` | File explorer positioning customization |
| `.stylua.toml` | Lua code formatting rules |
| `.neoconf.json` | Neovim development tools configuration |

## Getting Started for Development

1. **Install Neovim** (0.8+ recommended)
2. **Clone/configure** this repository as your Neovim config
3. **Start Neovim**: `nvim`
4. Lazy will auto-install plugins on first run
5. Run `:Lazy` to manage plugins
6. Check `:LspInfo` to verify LSP servers are running
7. Open a TypeScript/Vue file to test ESLint integration

## Troubleshooting

### Plugins not loading
- Run `:Lazy sync` to install/update all plugins
- Check `:Lazy` for error messages

### LSP issues
- Run `:LspRestart` to reload language servers
- Check `:LspInfo` for server status
- Verify file is in a supported language directory

### ESLint not formatting
- Ensure project has an `.eslintrc.*` file
- Check `:messages` for ESLint errors
- Verify `eslint` LSP server is attached (`:LspInfo`)

### Git diff not working
- Ensure you're in a git repository
- Check diffview keymaps: `:map <leader>g`
- Try `:DiffviewOpen` directly to test

## Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [LazyVim GitHub](https://github.com/LazyVim/LazyVim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [vscode.nvim](https://github.com/Mofiqul/vscode.nvim)
