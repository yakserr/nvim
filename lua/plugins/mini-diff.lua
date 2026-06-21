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
        require("mini.diff").toggle_overlay(0)
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
