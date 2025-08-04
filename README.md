# 🚀 Personal Neovim Configuration

A highly customized [LazyVim](https://github.com/LazyVim/LazyVim) setup optimized for modern development with AI assistance, transparent theming, and enhanced Git workflows.

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-v12+-blue.svg)](https://lazyvim.github.io)
[![AI Powered](https://img.shields.io/badge/AI-Claude%20%26%20Copilot-purple.svg)](#ai-integration)

## ✨ Features

### 🤖 AI Integration
- **Claude Code**: Full integration with Anthropic's Claude for AI-assisted coding
  - Toggle, focus, resume, and continue conversations
  - Direct buffer sending and file tree integration
  - Diff management with accept/deny options
- **GitHub Copilot**: Intelligent code completion with custom Tab handling
  - Auto-trigger suggestions with debounced responses
  - Smart integration with nvim-cmp completion
  - Enabled for markdown and help files

### 🎨 Visual Experience
- **Transparent VSCode Theme**: Beautiful transparent setup with comprehensive overrides
  - Floating windows, sidebars, and telescope transparency
  - Custom highlight groups for consistent appearance
  - Optimized for terminal transparency

### 🛠️ Development Tools
- **Enhanced Git Workflow**: Powered by Diffview with custom keymaps
- **Multi-Language Support**: 10+ language extras including TypeScript, Vue, Svelte, SQL
- **Advanced Editing**: Mini-surround, yanky, dial, inc-rename, mini-move
- **Testing & Linting**: ESLint integration with core test utilities

### ⌨️ Custom Keymaps
- `jj` - Alternative escape from insert mode
- `<leader>a*` - Complete Claude Code workflow (toggle, focus, add, send, diff)
- `<leader>g*` - Git operations (diff, history, close, refresh)

## 📦 Installation

### Prerequisites
- Neovim >= 0.10.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope
- Node.js for language servers

### Setup
1. **Backup existing configuration:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration:**
   ```bash
   git clone https://github.com/your-username/nvim-config ~/.config/nvim
   ```

3. **Launch Neovim:**
   ```bash
   nvim
   ```
   LazyVim will automatically install all plugins on first run.

4. **Configure AI tools:**
   - Set up Claude Code authentication
   - Configure GitHub Copilot with `:Copilot auth`

## 🔧 Configuration Details

### Plugin Structure
```
lua/
├── config/
│   ├── keymaps.lua      # Custom keymaps (jj escape)
│   ├── options.lua      # Neovim options
│   └── lazy.lua         # Plugin manager setup
└── plugins/
    ├── claudecode.lua   # Claude AI integration
    ├── copilot.lua      # GitHub Copilot setup
    ├── colorscheme.lua  # Transparent VSCode theme
    └── diffview.lua     # Git diff visualization
```

### LazyVim Extras Enabled
- **AI**: `lazyvim.plugins.extras.ai.copilot`
- **Coding**: `mini-surround`, `yanky`
- **Editor**: `dial`, `inc-rename`, `mini-move`
- **Languages**: `git`, `json`, `markdown`, `sql`, `svelte`, `tailwind`, `toml`, `typescript`, `vue`, `yaml`
- **Linting**: `eslint`
- **Testing**: `test.core`
- **UI**: `smear-cursor`
- **Utilities**: `dot`, `mini-hipatterns`

## 🚀 Usage Guide

### AI-Powered Development
1. **Claude Code Workflow:**
   - `<leader>ac` - Toggle Claude panel
   - `<leader>ab` - Add current buffer to context
   - `<leader>as` - Send selected text to Claude
   - `<leader>aa` - Accept Claude's diff suggestions
   - `<leader>ad` - Deny Claude's diff suggestions

2. **Copilot Integration:**
   - `Tab` - Accept Copilot suggestion (when visible)
   - `Alt+]` / `Alt+[` - Navigate suggestions
   - `Ctrl+]` - Dismiss suggestion

### Git Operations
- `<leader>gd` - Open git diff view
- `<leader>gh` - View file history
- `<leader>gr` - Refresh diff view
- `<leader>gq` - Close diff view

### Quick Navigation
- `jj` - Exit insert mode (alternative to Esc)
- Standard LazyVim keymaps for file navigation, searching, and more

## 🎛️ Customization

### Theme Modifications
Edit `lua/plugins/colorscheme.lua` to customize transparency and colors:
```lua
-- Modify group_overrides for different transparency levels
group_overrides = {
  NormalFloat = { bg = "NONE" },  -- Transparent floating windows
  -- Add your custom overrides here
}
```

### Adding New Plugins
Create new files in `lua/plugins/` directory:
```lua
-- lua/plugins/your-plugin.lua
return {
  "author/plugin-name",
  opts = {
    -- your configuration
  }
}
```

### Custom Keymaps
Add keymaps to `lua/config/keymaps.lua`:
```lua
vim.keymap.set("mode", "key", "action", { desc = "Description" })
```

## 📚 References
- [LazyVim Documentation](https://lazyvim.github.io)
- [Claude Code Plugin](https://github.com/coder/claudecode.nvim)
- [Neovim Documentation](https://neovim.io/doc)

---
*This configuration is a personal setup optimized for AI-assisted development with a focus on transparency and modern tooling.*
