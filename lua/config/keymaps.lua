-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- keymaps are automatically loaded on the VeryLazy event

-- :e# (last buffer)
vim.keymap.set("n", "<leader>l", "<cmd>e#<cr>", { desc = "[L]ast buffer" })
