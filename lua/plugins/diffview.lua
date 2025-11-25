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

      -- Compare against default branch (auto-detected)
      {
        "<leader>gm",
        function()
          -- Get the default branch (main, master, trunk, etc.)
          local handle = io.popen("git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'")
          local default_branch = handle:read("*a"):gsub("%s+", "")
          handle:close()

          -- Fallback to common branch names if detection fails
          if default_branch == "" then
            local branches = { "main", "master", "trunk" }
            for _, branch in ipairs(branches) do
              local check = io.popen("git rev-parse --verify " .. branch .. " 2>/dev/null")
              local result = check:read("*a")
              check:close()
              if result ~= "" then
                default_branch = branch
                break
              end
            end
          end

          if default_branch ~= "" then
            vim.cmd("CodeDiff " .. default_branch)
          else
            vim.notify("Could not detect default branch", vim.log.levels.ERROR)
          end
        end,
        desc = "Git Diff vs default branch",
      },
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
