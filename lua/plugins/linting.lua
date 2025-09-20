local eslint_config_files = {
  "eslint.config.js",
  "eslint.config.cjs",
  "eslint.config.mjs",
  "eslint.config.ts",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.mjs",
  ".eslintrc.json",
  ".eslintrc",
}

local function has_local_eslint(dir)
  if vim.fn.executable("eslint_d") ~= 1 then
    return false
  end

  local root = vim.fs.find(eslint_config_files, { path = dir, upward = true })[1]
  return root ~= nil
end

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local js_like = {
        javascript = true,
        javascriptreact = true,
        typescript = true,
        typescriptreact = true,
      }

      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for ft in pairs(js_like) do
        local formatters = opts.formatters_by_ft[ft] or {}
        if not vim.tbl_contains(formatters, "eslint_d") then
          table.insert(formatters, 1, "eslint_d")
        end
        opts.formatters_by_ft[ft] = formatters
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.eslint_d = vim.tbl_deep_extend("force", opts.formatters.eslint_d or {}, {
        condition = function(ctx)
          return has_local_eslint(ctx.dirname)
        end,
      })

      local previous = opts.format_on_save
      opts.format_on_save = function(bufnr)
        if js_like[vim.bo[bufnr].filetype] then
          return { timeout_ms = 2000, lsp_fallback = false }
        end
        if type(previous) == "function" then
          return previous(bufnr)
        end
        return previous
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local js_like = {
        javascript = true,
        javascriptreact = true,
        typescript = true,
        typescriptreact = true,
      }

      opts.linters_by_ft = opts.linters_by_ft or {}
      for ft in pairs(js_like) do
        local linters = opts.linters_by_ft[ft] or {}
        if not vim.tbl_contains(linters, "eslint_d") then
          table.insert(linters, 1, "eslint_d")
        end
        opts.linters_by_ft[ft] = linters
      end

      opts.linters = opts.linters or {}
      opts.linters.eslint_d = vim.tbl_deep_extend("force", opts.linters.eslint_d or {}, {
        condition = function(ctx)
          return has_local_eslint(ctx.dirname)
        end,
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "eslint_d") then
        table.insert(opts.ensure_installed, "eslint_d")
      end
    end,
  },
}
