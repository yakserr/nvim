return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Merged with LazyVim's defaults (opts_extend), so only list what it misses.
    -- highlight/indent/folds are already enabled by LazyVim.
    -- Go's Tree-sitter indent needs a complete syntax tree to indent a newly
    -- opened block. Keep highlighting/folds, but use Neovim's native GoIndent.
    indent = {
      disable = { "go" },
    },
    ensure_installed = {
      "blade",
      "vue",
      "css",
      "scss",
      "dockerfile",
      "git_config",
      "gitcommit",
      "gitignore",
    },
  },
}
