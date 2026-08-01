local eslint_configs = {
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  "eslint.config.mts",
  "eslint.config.cts",
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.json",
  ".eslintrc.yaml",
  ".eslintrc.yml",
}

local prettier_configs = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  ".prettierrc.ts",
  ".prettierrc.cts",
  ".prettierrc.mts",
  ".prettierrc.toml",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
  "prettier.config.ts",
  "prettier.config.cts",
  "prettier.config.mts",
}

local function read_package_json(path)
  local ok, lines = pcall(vim.fn.readfile, path)
  if not ok then
    return nil
  end

  local decoded, package = pcall(vim.json.decode, table.concat(lines, "\n"))
  return decoded and package or nil
end

local function script_uses(package, formatter)
  for _, script in pairs(package.scripts or {}) do
    if type(script) == "string" then
      if formatter == "eslint" and script:find("eslint", 1, true) and script:find("--fix", 1, true) then
        return true
      end
      if formatter == "prettier" and script:find("prettier", 1, true) and script:find("--write", 1, true) then
        return true
      end
    end
  end
  return false
end

local function project_root(configs, package_field, formatter)
  return function(_, ctx)
    return vim.fs.root(ctx.dirname, function(name, path)
      if vim.tbl_contains(configs, name) then
        return true
      end
      if name ~= "package.json" then
        return false
      end

      local package = read_package_json(vim.fs.joinpath(path, name))
      return package ~= nil and (package[package_field] ~= nil or script_uses(package, formatter))
    end)
  end
end

-- Pick the formatter from the project's own configuration. ESLint wins when a
-- project contains both configs; Prettier is only used for Prettier-only projects.
local web_formatters = { "eslint_d", "prettier", stop_after_first = true }

local function laravel_root(_, ctx)
  return vim.fs.root(ctx.dirname, { "artisan" })
end

local function local_pint(_, ctx)
  local root = vim.fs.root(ctx.dirname, { "artisan" })
  return root and vim.fs.joinpath(root, "vendor", "bin", "pint") or "pint"
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = web_formatters,
      javascriptreact = web_formatters,
      typescript = web_formatters,
      typescriptreact = web_formatters,
      vue = web_formatters,
      -- Never fall back to generic LSP formatting for Laravel. If the project
      -- has not installed vendor/bin/pint yet, formatting stays disabled.
      php = { "pint", lsp_format = "never" },
      lua = { "stylua" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
    },
    formatters = {
      pint = {
        command = local_pint,
        cwd = laravel_root,
        require_cwd = true,
      },
      eslint_d = {
        prefer_local = "node_modules/.bin",
        cwd = project_root(eslint_configs, "eslintConfig", "eslint"),
        require_cwd = true,
      },
      prettier = {
        prefer_local = "node_modules/.bin",
        cwd = project_root(prettier_configs, "prettier", "prettier"),
        require_cwd = true,
      },
    },
  },
}
