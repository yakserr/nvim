-- vscode-diff.nvim plugin configuration
-- VSCode-style diff viewing with two-tier highlighting
-- Replaces diffview.nvim for git diff operations

return {
  -- Disable snacks.nvim default git keymaps that conflict
  {
    "folke/snacks.nvim",
    optional = true,
    keys = {
      { "<leader>gd", false },
      { "<leader>gD", false },
      { "<leader>gs", false },
    },
  },

  -- Disable fzf-lua default git keymaps that conflict
  {
    "ibhagwan/fzf-lua",
    optional = true,
    keys = {
      { "<leader>gd", false },
      { "<leader>gD", false },
      { "<leader>gs", false },
    },
  },

  -- vscode-diff.nvim configuration
  {
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    lazy = false, -- Load immediately to ensure keymaps are set
    cmd = { "CodeDiff" },
    keys = {
      -- Git diff (explorer view showing all changed files)
      { "<leader>gd", "<cmd>CodeDiff<cr>", desc = "Git Diff (explorer)" },

      -- Git diff current file vs last commit
      { "<leader>gD", "<cmd>CodeDiff file HEAD~1<cr>", desc = "Git Diff (file vs last commit)" },

      -- Git status (explorer view)
      { "<leader>gs", "<cmd>CodeDiff<cr>", desc = "Git Status (explorer)" },

      -- Diff current file vs HEAD
      { "<leader>go", "<cmd>CodeDiff file HEAD<cr>", desc = "Diff current file vs HEAD" },

      -- Close diff tab
      { "<leader>gq", "<cmd>tabclose<cr>", desc = "Close diff tab" },

      -- Compare against main branch
      { "<leader>gm", "<cmd>CodeDiff main<cr>", desc = "Git Diff vs main branch" },
    },
    config = function()
      require("vscode-diff").setup({
        highlights = {
          line_insert = "DiffAdd",
          line_delete = "DiffDelete",
        },
        diff = {
          disable_inlay_hints = true,
        },
        keymaps = {
          view = {
            next_hunk = "]c",
            prev_hunk = "[c",
            next_file = "]f",
            prev_file = "[f",
          },
          explorer = {
            select = "<CR>",
            hover = "K",
            refresh = "R",
          },
        },
      })
    end,
  },
}
