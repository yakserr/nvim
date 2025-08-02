-- ~/.config/nvim/lua/plugins/diffview.lua
return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Git Diff" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "File History" },
    { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    -- add to refreash the diffview
    { "<leader>gr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh Diffview" },
  },
}
