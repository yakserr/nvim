return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      preset = "super-tab",
    }

    opts.sources = opts.sources or {}
    opts.sources.default = opts.sources.default or {}
    if not vim.tbl_contains(opts.sources.default, "laravel") then
      table.insert(opts.sources.default, "laravel")
    end

    opts.sources.providers = opts.sources.providers or {}
    opts.sources.providers.laravel = {
      name = "Laravel",
      module = "laravel.extensions.completion.blink",
    }
  end,
}
