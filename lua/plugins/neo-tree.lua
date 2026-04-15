return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      width = 35, -- Comfortable sidebar width
    },

    filesystem = {
      follow_current_file = {
        enabled = true,          -- Auto-reveal current file in tree
        leave_dirs_open = true,  -- Keep parent dirs expanded
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      use_libuv_file_watcher = true, -- Auto-refresh on external changes
    },

    -- Git status indicators in the tree
    default_component_configs = {
      git_status = {
        symbols = {
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "󰁕",
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        },
      },
    },
  },
}
