return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    background = { light = "latte", dark = "mocha" },

    transparent_background = true,
    term_colors = true,

    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      types = {},
      operators = {},
    },

    integrations = {
      treesitter = true,
      treesitter_context = true,
      rainbow_delimiters = true,
      -- file tree
      neotree = true,
      -- git
      gitsigns = { enabled = true, transparent = true },
      -- UI / floats
      snacks = { enabled = true, indent_scope_color = "mauve" },
      dropbar = { enabled = true, color_mode = true },
      mason = true,
      -- indent guides
      indent_blankline = {
        enabled = true,
        scope_color = "mauve",
        colored_indent_levels = false,
      },
    },

    highlight_overrides = {
      mocha = function(c)
        return {
          -- Keep floats transparent (same as your autocmds setup)
          NormalFloat  = { bg = "NONE" },
          FloatBorder  = { fg = c.surface1, bg = "NONE" },
          FloatTitle   = { fg = c.mauve, bg = "NONE" },
          -- Snacks
          SnacksNormal           = { bg = "NONE" },
          SnacksNormalNC         = { bg = "NONE" },
          SnacksWinBar           = { bg = "NONE" },
          SnacksWinBarNC         = { bg = "NONE" },
          SnacksBackdrop         = { bg = "NONE" },
          SnacksTerminal         = { bg = "NONE" },
          SnacksTerminalNormal   = { bg = "NONE" },
          SnacksTerminalNormalNC = { bg = "NONE" },
          SnacksTerminalBorder   = { bg = "NONE" },
        }
      end,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
