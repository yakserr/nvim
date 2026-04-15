-- Multi-cursor editing (like VSCode Ctrl+D)
return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    -- VSCode-like keybindings
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",         -- Ctrl+D equivalent: select word under cursor
      ["Find Subword Under"] = "<C-n>", -- Also works in visual mode
      ["Add Cursor Down"] = "<C-S-j>",  -- Add cursor below
      ["Add Cursor Up"] = "<C-S-k>",    -- Add cursor above
      ["Select All"] = "<C-S-l>",       -- Select all occurrences
      ["Skip Region"] = "<C-x>",        -- Skip current and find next
    }

    -- Visual settings
    vim.g.VM_theme = "codedark"          -- VSCode-like highlight colors
    vim.g.VM_highlight_matches = "underline" -- Underline matches
    vim.g.VM_show_warnings = 0           -- Less noisy
  end,
}
