-- Configure copilot.lua for VSCode-like behavior
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          -- Remove the accept binding to allow custom behavior
          -- accept = "<Tab>", -- Commented out to allow conditional behavior
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        -- VSCode-like behavior: Tab works normally when no suggestion,
        -- but accepts suggestion when it appears
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
        typescript = true,
        javascript = true,
        vue = true,
        typescriptreact = true,
        javascriptreact = true,
        svelte = true,
        lua = true,
      },
    })
    
    -- Create custom Tab keymap for VSCode-like behavior
    -- This will be loaded after copilot setup
    vim.api.nvim_create_autocmd("InsertEnter", {
      callback = function()
        -- Setup conditional Tab behavior in insert mode
        vim.keymap.set("i", "<Tab>", function()
          local copilot = require("copilot.suggestion")
          if copilot.is_visible() then
            copilot.accept()
            return ""
          end
          return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
        end, { silent = true, expr = true })
      end,
    })
  end,
}
