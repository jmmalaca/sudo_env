-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- resume last fzf-lua picker
vim.keymap.set(
  "n",
  "<leader>sx",
  function() require("fzf-lua").resume() end,
  { noremap = true, silent = true, desc = "Last Search" }
)
