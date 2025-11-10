-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Override default terminal keymaps from LazyVim
vim.keymap.set("n", "<leader>ft", function()
  -- Non-persistent terminal (closes on exit)
  local term = _G.term1
  if term then
    term:toggle()
  end
end, { desc = "Toggle non-persistent terminal (floating)" })

vim.keymap.set("n", "<leader>fT", function()
  -- Persistent terminal (keeps state and history)
  local term = _G.term2
  if term then
    term:toggle()
  end
end, { desc = "Toggle persistent terminal (floating)" })

-- Multiple terminal instances
vim.keymap.set("n", "<leader>1", function()
  local term = _G.term1
  if term then
    term:toggle()
  end
end, { desc = "Toggle terminal 1" })

vim.keymap.set("n", "<leader>2", function()
  local term = _G.term2
  if term then
    term:toggle()
  end
end, { desc = "Toggle terminal 2" })

vim.keymap.set("n", "<leader>3", function()
  local term = _G.term3
  if term then
    term:toggle()
  end
end, { desc = "Toggle terminal 3" })
