return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local ensure = { "tsx", "typescript", "javascript", "json", "jsonc", "css", "scss" }
      for _, lang in ipairs(ensure) do
        if not vim.tbl_contains(opts.ensure_installed, lang) then
          table.insert(opts.ensure_installed, lang)
        end
      end
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    ft = { "javascriptreact", "typescriptreact", "html" },
    opts = {},
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end,
  },
}
