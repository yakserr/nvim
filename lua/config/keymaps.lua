-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- ============================================================================
-- VSCode-like Movement & Editing
-- ============================================================================

-- Move selected lines up/down (like Alt+Up/Down in VSCode)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Keep cursor centered when searching
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Join lines without moving cursor
map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })

-- ============================================================================
-- Better Clipboard Operations
-- ============================================================================

-- Paste without losing register (replace selection without yanking it)
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- ============================================================================
-- Quick Actions
-- ============================================================================

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Better escape
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- ============================================================================
-- LSP Enhancements
-- ============================================================================

-- Toggle inlay hints
map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- Quick diagnostics
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location list" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix list" })

-- ============================================================================
-- Quick Find & Replace
-- ============================================================================

-- Replace word under cursor
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- ============================================================================
-- Miscellaneous
-- ============================================================================

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent left (stay selected)" })
map("v", ">", ">gv", { desc = "Indent right (stay selected)" })

-- Add blank lines
map("n", "]<space>", "o<Esc>k", { desc = "Add blank line below" })
map("n", "[<space>", "O<Esc>j", { desc = "Add blank line above" })
