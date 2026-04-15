-- Sticky scroll: shows parent function/class/block at top of screen (like VSCode)
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = {
    max_lines = 3,           -- Show at most 3 context lines
    min_window_height = 20,  -- Don't show on small windows
    multiline_threshold = 5, -- Max lines for multiline context
    trim_scope = "outer",    -- Trim from outer scope
    mode = "cursor",         -- Show context for cursor position
    separator = "─",         -- Separator line between context and code
  },
  keys = {
    {
      "<leader>uc",
      function()
        local tsc = require("treesitter-context")
        tsc.toggle()
        if tsc.enabled() then
          vim.notify("Sticky Scroll: ON", vim.log.levels.INFO)
        else
          vim.notify("Sticky Scroll: OFF", vim.log.levels.INFO)
        end
      end,
      desc = "Toggle Sticky Scroll (Context)",
    },
  },
}
