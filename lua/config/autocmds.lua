-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ============================================================================
-- Auto-save
-- ============================================================================

-- Auto-save on focus lost or buffer leave (like VSCode)
autocmd({ "FocusLost", "BufLeave" }, {
  group = augroup("auto_save", { clear = true }),
  callback = function(event)
    local buf = event.buf
    -- Only save if buffer is modified, has a filename, and is a normal buffer
    if
      vim.bo[buf].modified
      and vim.bo[buf].buftype == ""
      and vim.fn.bufname(buf) ~= ""
      and not vim.bo[buf].readonly
    then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("silent! write")
      end)
    end
  end,
  desc = "Auto-save on focus lost",
})

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
