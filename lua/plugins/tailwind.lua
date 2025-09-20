return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      local tailwind = vim.tbl_deep_extend("force", {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "html",
          "css",
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { [[tw`([^`]*)`]], [[([^`]*)]] },
                { [[tw\.\w+`([^`]*)`]], [[([^`]*)]] },
                { [[clsx\(([^)]*)\)]], [[([^"',%s]+)]] },
                { [[classnames\(([^)]*)\)]], [[([^"',%s]+)]] },
              },
            },
            includeLanguages = {
              typescript = "javascript",
              typescriptreact = "javascript",
            },
          },
        },
      }, opts.servers.tailwindcss or {})
      opts.servers.tailwindcss = tailwind
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "tailwindcss-language-server") then
        table.insert(opts.ensure_installed, "tailwindcss-language-server")
      end
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    lazy = true,
    opts = {
      color_square_width = 2,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "roobert/tailwindcss-colorizer-cmp.nvim" },
    opts = function(_, opts)
      opts.formatting = opts.formatting or {}
      opts.formatting.format = require("tailwindcss-colorizer-cmp").formatter(opts.formatting.format)
    end,
  },
}
