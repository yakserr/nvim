return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d" },
      lua = { "stylua" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
    },
    formatters = {
      eslint_d = {
        prefer_local = "node_modules/.bin",
      },
      prettier = {
        prefer_local = "node_modules/.bin",
      },
    },
  },
}
