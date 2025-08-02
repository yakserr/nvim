return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Enable transparent background
      transparent = true,

      -- Enable italic comments
      italic_comments = true,

      -- Underline links
      underline_links = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

      -- Override highlight groups for better transparency
      group_overrides = {
        -- Make floating windows transparent
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },

        -- Make all sidebar components transparent
        NvimTreeNormal = { bg = "NONE" },
        NvimTreeNormalNC = { bg = "NONE" },
        NvimTreeEndOfBuffer = { bg = "NONE" },
        NvimTreeWinSeparator = { bg = "NONE", fg = "NONE" },

        -- Neo-tree transparency
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },
        NeoTreeEndOfBuffer = { bg = "NONE" },
        NeoTreeWinSeparator = { bg = "NONE", fg = "NONE" },

        -- File explorer transparency
        Directory = { bg = "NONE" },

        -- Status line transparency (if you want it transparent)
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },

        -- Window separator transparency
        WinSeparator = { bg = "NONE", fg = "#3e4451" },
        VertSplit = { bg = "NONE", fg = "#3e4451" },

        -- Make telescope transparent
        TelescopeNormal = { bg = "NONE" },
        TelescopeBorder = { bg = "NONE" },
        TelescopePromptNormal = { bg = "NONE" },
        TelescopeResultsNormal = { bg = "NONE" },
        TelescopePreviewNormal = { bg = "NONE" },

        -- Make which-key transparent
        WhichKeyFloat = { bg = "NONE" },

        -- Make lazy.nvim transparent
        LazyNormal = { bg = "NONE" },

        -- Make mason transparent
        MasonNormal = { bg = "NONE" },

        -- Additional transparency for sidebars
        Sidebar = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        FoldColumn = { bg = "NONE" },
      },
    },
  },

  -- Configure LazyVim to use vscode theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
