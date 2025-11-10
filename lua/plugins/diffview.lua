-- diffview.nvim plugin configuration
-- Replace vim-fugitive keymaps with diffview equivalents

return {
  "sindrets/diffview.nvim",
  lazy = true,
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    -- Replace <leader>gd (Git Diff hunks)
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff (working tree)" },

    -- Replace <leader>gD (Git Diff origin)
    { "<leader>gD", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Git Diff (last commit)" },
    -- Alternative: DiffviewOpen HEAD~2, DiffviewOpen origin/main...HEAD, etc.

    -- Replace <leader>gs (Git Status) - opens file history
    { "<leader>gs", "<cmd>DiffviewFileHistory<cr>", desc = "Git File History" },

    -- Additional useful diffview commands
    { "<leader>go", "<cmd>DiffviewFileHistory %<cr>", desc = "Open current file history" },

    -- Close diffview
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },

    -- Compare against different refs
    { "<leader>gm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Git Diff vs main branch" },
  },
  config = function()
    -- Optional: Configure diffview here
    -- See: https://github.com/sindrets/diffview.nvim#setup
    require("diffview").setup({
      -- Configuration options
      use_icons = true, -- Requires nvim-web-devicons
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
      },
    })
  end,
}
