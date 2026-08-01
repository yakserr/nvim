-- Inline diff overlay (closest to VSCode's inline diff)
-- Toggle with <leader>go: deleted lines show as ghost text in-place,
-- char-level highlight on changes.
return {
  "nvim-mini/mini.diff",
  event = "VeryLazy",
  keys = {
    {
      "<leader>go",
      function()
        local diff = require("mini.diff")
        -- mini.diff only auto-enables real file buffers; toggle_overlay errors on
        -- explorer/terminal/dashboard buffers, so bail out with a notice instead.
        if diff.get_buf_data(0) == nil then
          return vim.notify("No git diff for this buffer", vim.log.levels.WARN)
        end
        diff.toggle_overlay(0)
      end,
      desc = "Diff overlay (VSCode-like)",
    },
  },
  opts = {
    -- gitsigns owns the sign column; mini.diff only draws the overlay
    view = {
      style = "sign",
      signs = { add = "", change = "", delete = "" },
    },
  },
}
