return {
  "nvim-neo-tree/neo-tree.nvim",
  -- make the neo-tree window in right side
  opts = {
    window = {
      position = "right",
    },

    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
