return {
  -- Pint is the single source of truth for PHP style in Laravel projects.
  -- Disable the generic PHPCS linter added by LazyVim's PHP extra.
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = {}
    end,
  },

  {
    "adalessa/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
    },
    ft = { "php", "blade" },
    event = { "BufEnter composer.json" },
    keys = {
      {
        "<leader>ll",
        function()
          Laravel.pickers.laravel()
        end,
        desc = "Laravel: Picker",
      },
      {
        "<leader>la",
        function()
          Laravel.pickers.artisan()
        end,
        desc = "Laravel: Artisan",
      },
      {
        "<leader>lr",
        function()
          Laravel.pickers.routes()
        end,
        desc = "Laravel: Routes",
      },
      {
        "<leader>lm",
        function()
          Laravel.pickers.make()
        end,
        desc = "Laravel: Make",
      },
      {
        "<leader>lt",
        function()
          Laravel.commands.run("actions")
        end,
        desc = "Laravel: Code Actions",
      },
      {
        "gf",
        function()
          if Laravel.app("gf").cursorOnResource() then
            return "<cmd>lua Laravel.commands.run('gf')<cr>"
          end
          return "gf"
        end,
        expr = true,
        noremap = true,
        desc = "Laravel: Go to Resource",
      },
    },
    opts = {
      debug_level = vim.log.levels.WARN,
      -- model_info keeps an async buffer id after BufEnter. If the buffer is
      -- closed before its loader finishes, Laravel.nvim accesses a stale id.
      -- Keep it disabled until upstream validates the buffer after yielding.
      extensions = {
        model_info = { enable = false },
      },
      features = {
        pickers = {
          provider = "snacks",
        },
      },
    },
  },
}
