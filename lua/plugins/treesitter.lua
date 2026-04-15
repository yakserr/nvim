return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Web development
      "javascript",
      "typescript",
      "tsx",
      "vue",
      "json",
      "jsonc",
      "html",
      "css",
      "scss",
      -- Config files
      "yaml",
      "toml",
      "dockerfile",
      -- Documentation
      "markdown",
      "markdown_inline",
      -- Scripting
      "lua",
      "bash",
      "regex",
      -- Git
      "git_config",
      "gitcommit",
      "gitignore",
    },
    -- Better highlighting
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    -- Better indentation
    indent = { enable = true },
  },
}
