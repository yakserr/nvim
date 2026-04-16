-- Git enhancement plugins
return {
  -- Better diff viewer
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Diff View: Open" },
      { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Diff View: Close" },
      { "<leader>gvh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diff: File History" },
      { "<leader>gvH", "<cmd>DiffviewFileHistory<cr>", desc = "Diff: Repo History" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
        },
      },
      file_panel = {
        win_config = {
          position = "left",
          width = 35,
        },
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
