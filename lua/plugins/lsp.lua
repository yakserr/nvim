return {
  -- Configure LSP servers
  "neovim/nvim-lspconfig",
  opts = {
    -- disable inlay hints for global
    inlay_hints = {
      enabled = false,
    },
    servers = {
      vtsls = {},
      volar = {},
    },
    setup = {
      vtsls = function()
        Snacks.util.lsp.on({ name = "vtsls" }, function(buffer, client)
          -- Disable formatting capabilities to use ESLint exclusively
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end)
      end,
      volar = function()
        Snacks.util.lsp.on({ name = "volar" }, function(buffer, client)
          -- Delegate formatting to eslint_d
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end)
      end,
    },
  },
}
