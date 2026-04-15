-- Breadcrumb navigation in winbar (like VSCode's breadcrumbs: file > class > function)
return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  opts = {
    bar = {
      -- Sources for breadcrumb content
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        local utils = require("dropbar.utils")
        if vim.bo[buf].ft == "markdown" then
          return { sources.markdown }
        end
        if vim.bo[buf].buftype == "terminal" then
          return { sources.terminal }
        end
        return {
          sources.path,
          utils.source.fallback({
            sources.lsp,
            sources.treesitter,
          }),
        }
      end,
    },
    icons = {
      ui = {
        bar = {
          separator = "  ", -- Chevron separator like VSCode
        },
      },
    },
  },
}
