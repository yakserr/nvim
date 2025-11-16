return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<leader>ft", function() local term = _G.term1 if term then term:toggle() end end, desc = "Toggle non-persistent terminal (floating)" },
    { "<leader>fT", function() local term = _G.term2 if term then term:toggle() end end, desc = "Toggle persistent terminal (floating)" },
    { "<leader>1", function() local term = _G.term1 if term then term:toggle() end end, desc = "Toggle terminal 1" },
    { "<leader>2", function() local term = _G.term2 if term then term:toggle() end end, desc = "Toggle terminal 2" },
    { "<leader>3", function() local term = _G.term3 if term then term:toggle() end end, desc = "Toggle terminal 3" },
  },
  event = "VeryLazy",
  config = function()
    local toggleterm = require("toggleterm")

    -- Get current transparency setting from colorscheme
    local has_vscode, vscode = pcall(require, "vscode")
    local transparent = false
    if has_vscode then
      -- Check if transparency is enabled in vscode setup
      transparent = true -- vscode theme has transparent = true
    end

    toggleterm.setup({
      -- Size configuration
      size = function(term)
        if term.direction == "float" then
          return 50 -- 50% of screen size
        end
      end,

      -- Terminal behavior
      open_mapping = nil, -- We'll use custom keymaps
      close_on_exit = false, -- Keep terminal open after command exits
      shade_terminals = false, -- Don't shade terminal backgrounds
      start_in_insert = true, -- Start in insert mode
      insert_mappings = true, -- Enable insert mode mappings
      terminal_mappings = true, -- Enable terminal mode mappings
      persist_size = true, -- Remember terminal size

      -- Visual settings
      direction = "float", -- Default direction
      float_opts = {
        border = "rounded", -- Rounded border like vscode
        width = function()
          return math.floor(vim.o.columns * 0.7) -- 70% of screen width
        end,
        height = function()
          return math.floor(vim.o.lines * 0.7) -- 70% of screen height
        end,
        col = function()
          return math.floor((vim.o.columns - math.floor(vim.o.columns * 0.7)) / 2)
        end,
        row = function()
          return math.floor((vim.o.lines - math.floor(vim.o.lines * 0.7)) / 2)
        end,
      },

      -- Don't change directory automatically
      autochdir = false,
    })

    -- Create multiple terminal instances
    local Terminal = require("toggleterm.terminal").Terminal

    -- Terminal 1: Non-persistent (closes on command exit)
    local term1 = Terminal:new({
      direction = "float",
      close_on_exit = true, -- Non-persistent behavior
      hidden = true,
    })

    -- Terminal 2: Persistent (keeps state and history)
    local term2 = Terminal:new({
      direction = "float",
      close_on_exit = false, -- Persistent behavior
      hidden = true,
    })

    -- Terminal 3: Additional persistent terminal
    local term3 = Terminal:new({
      direction = "float",
      close_on_exit = false, -- Persistent behavior
      hidden = true,
    })

    -- Keybindings
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n>]], opts)
    end

    -- Auto-set terminal keymaps when entering terminal mode
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      command = "lua set_terminal_keymaps()",
    })

    -- Store terminals globally for keymaps
    _G.term1 = term1
    _G.term2 = term2
    _G.term3 = term3
  end,
}
