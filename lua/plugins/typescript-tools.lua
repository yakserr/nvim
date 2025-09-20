return {
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = {
          "fix_all",
          "add_missing_imports",
          "remove_unused_imports",
          "organize_imports",
        },
        tsserver_max_memory = 4096,
      },
    },
    config = function(_, opts)
      local util = require("lazyvim.util")
      opts.capabilities = vim.tbl_deep_extend(
        "force",
        {},
        util.opts("nvim-lspconfig").capabilities or {},
        opts.capabilities or {}
      )
      require("typescript-tools").setup(opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.tsserver = false
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local tools = { "typescript-language-server" }
      for _, tool in ipairs(tools) do
        if not vim.tbl_contains(opts.ensure_installed, tool) then
          table.insert(opts.ensure_installed, tool)
        end
      end
    end,
  },
}

