return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Set background before loading the colorscheme
    vim.o.background = 'dark'

    -- Setup the colorscheme with transparency
    require('vscode').setup({
      transparent = true,           -- Enable transparency
      italic_comments = true,       -- Italicize comments
      italic_inlayhints = false,    -- Don't italicize inlay hints
      underline_links = true,       -- Add underlines to links
      disable_nvimtree_bg = true,   -- Disable NvimTree background
      terminal_colors = true,       -- Set terminal colors
    })

    -- Load the colorscheme
    vim.cmd.colorscheme("vscode")
  end,
}
