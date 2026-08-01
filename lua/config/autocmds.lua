-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ============================================================================
-- Disable diagnostics for Markdown files
-- ============================================================================

autocmd("FileType", {
  group = augroup("markdown_no_diagnostics", { clear = true }),
  pattern = { "markdown" },
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
  desc = "Disable diagnostics (warnings/errors) for markdown files",
})

-- ============================================================================
-- Auto-show diagnostic float on cursor hold (VSCode-like hover)
-- ============================================================================

vim.o.updatetime = 500

autocmd("CursorHold", {
  group = augroup("diagnostic_hover", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
  desc = "Show diagnostic float when cursor rests on an error",
})

-- ============================================================================
-- Git Commit Messages
-- ============================================================================

-- Better git commit editing
autocmd("FileType", {
  group = augroup("git_commit", { clear = true }),
  pattern = { "gitcommit", "gitrebase" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  desc = "Git commit settings",
})

-- ============================================================================
-- Transparent floating windows (terminal, lazy, mason, etc.)
-- ============================================================================

local function clear_float_bg()
  local groups = {
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "SnacksNormal",
    "SnacksNormalNC",
    "SnacksWinBar",
    "SnacksWinBarNC",
    "SnacksBackdrop",
    "SnacksTerminal",
    "SnacksTerminalNormal",
    "SnacksTerminalNormalNC",
    "SnacksTerminalBorder",
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "NONE" })
  end
end

autocmd("ColorScheme", {
  group = augroup("transparent_floats", { clear = true }),
  callback = clear_float_bg,
  desc = "Transparent background for floating windows",
})

clear_float_bg()
