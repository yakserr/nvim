return {
  -- Configure LSP servers
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {},
    },
    setup = {
      vtsls = function()
        Snacks.util.lsp.on({ name = "vtsls" }, function(buffer, client)
          -- Disable formatting capabilities to use ESLint exclusively
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end)
      end,
    },
  },
}
