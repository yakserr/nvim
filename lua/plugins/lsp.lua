return {
  -- Configure LSP servers
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Disable vtsls (TypeScript) formatting to use ESLint exclusively
      vtsls = {
        settings = {
          typescript = {
            format = { enable = false },
          },
          javascript = {
            format = { enable = false },
          },
        },
      },
    },
  },
}
