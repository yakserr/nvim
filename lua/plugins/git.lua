-- Git enhancement plugins
return {
  -- VSCode-style diff viewer (replaces diffview.nvim). Quit a view with `q`,
  -- toggle side-by-side/inline with `t`, `g?` for the full in-view keymap list.
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    keys = {
      { "<leader>gvo", "<cmd>CodeDiff<cr>", desc = "Diff View: Open" },
      { "<leader>gvf", "<cmd>CodeDiff file HEAD<cr>", desc = "Diff: File vs HEAD" },
      { "<leader>gvh", "<cmd>CodeDiff history HEAD~50 %<cr>", desc = "Diff: File History" },
      { "<leader>gvH", "<cmd>CodeDiff history<cr>", desc = "Diff: Repo History" },
    },
    opts = {
      diff = {
        -- Off by default; this is the one thing diffview couldn't do.
        compute_moves = true,
      },
      explorer = {
        position = "left",
        width = 35,
      },
    },
  },

  -- Better git signs (already in LazyVim, but enhance it)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false, -- Enable with keymap
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    },
  },
}
