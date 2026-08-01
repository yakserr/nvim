-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Use one mature PHP language server. The Laravel integration also generates
-- Eloquent helper types specifically understood by Intelephense.
vim.g.lazyvim_php_lsp = "intelephense"

-- ============================================================================
-- VSCode-like Comfort Settings
-- ============================================================================

-- Scrolling behavior (keep context visible)
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right

-- Faster response
opt.updatetime = 200 -- Faster CursorHold (for LSP diagnostics)
opt.timeoutlen = 300 -- Faster which-key popup

-- Persistent undo (undo even after closing file)
opt.undofile = true
opt.undolevels = 10000

-- Disable swap files (git handles this better)
opt.swapfile = false
opt.backup = false

-- Visual improvements
opt.cursorline = true -- Highlight current line
opt.wrap = false -- No line wrap by default
opt.linebreak = true -- Break at word boundaries when wrap is on
opt.showbreak = "↪ " -- Show line continuation marker

-- Search improvements
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Unless uppercase is used
opt.inccommand = "split" -- Preview substitutions live

-- Better splits
opt.splitbelow = true -- New splits below current
opt.splitright = true -- New splits right of current
opt.splitkeep = "screen" -- Keep same screen position during splits

-- Line numbers
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers

-- Indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Indent by 2 spaces
opt.tabstop = 2 -- Tab = 2 spaces
opt.smartindent = true -- Smart auto-indent

-- Better completion
opt.completeopt = "menu,menuone,noselect"

-- ============================================================================
-- Diff: VSCode-like (cleaner hunks + aggressive line/char alignment)
-- ============================================================================
opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "indent-heuristic",
  "algorithm:histogram", -- smarter than default myers; closer to VSCode
  "linematch:60", -- align changed lines harder (was 40)
  "inline:char", -- char-level intra-line highlight
}

-- Confirm before closing modified buffers
opt.confirm = true

-- ============================================================================
-- Diagnostics Configuration (Better LSP Display)
-- ============================================================================

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Cleaner prefix
    spacing = 4,
    source = "if_many", -- Show source if multiple diagnostics
  },
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true, -- Sort by severity
})
