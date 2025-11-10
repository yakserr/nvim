return {
  -- Configure LSP servers
  "neovim/nvim-lspconfig",

  opts = {
    -- Automatically format on save is managed by LazyVim's formatting utility
    -- We just need to ensure the right servers have formatting capability
    servers = {
      -- ESLint will handle both linting and formatting
      eslint = {},
      -- TypeScript server should NOT have formatting when using ESLint
      tsserver = {
        -- This is set in the setup function below
      },
    },
    setup = {
      -- Configure ESLint to provide document formatting
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            -- Enable ESLint's formatting capability
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            -- Disable TypeScript server formatting to avoid conflicts
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
