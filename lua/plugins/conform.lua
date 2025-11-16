return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d" },
    },
    formatters = {
      eslint_d = {
        -- Prefer project-local eslint_d if available
        prefer_local = "node_modules/.bin",
      },
    },
  },
}
