return {
  "folke/snacks.nvim",
  opts = {
    explorer = { enabled = true },
    picker = {
      sources = {
        explorer = {
          -- Sidebar di KANAN (match behavior lama neo-tree)
          layout = { preset = "sidebar", layout = { position = "right" } },
          -- Tampilkan dotfiles + gitignored (kayak setting lama)
          hidden = true,
          ignored = true,
          -- Auto-reveal file yang lagi dibuka
          follow_file = true,
          -- Auto-refresh saat file berubah dari luar
          watch = true,
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer (cwd)",
    },
    {
      "<leader>E",
      function()
        Snacks.explorer({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Explorer (file dir)",
    },
  },
}
