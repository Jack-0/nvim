-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- keymaps are automatically loaded on the VeryLazy event

-- :e# (last buffer)
vim.keymap.set("n", "<leader>l", "<cmd>e#<cr>", { desc = "[L]ast buffer" })

-- gf that handles file:line format
local function gf_with_line()
  local line_text = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- 1-indexed

  -- find the file:line pattern the cursor sits on
  local best_file, best_lnum
  for file, lnum in line_text:gmatch("(%S+):(%d+)") do
    local s, e = line_text:find(file .. ":" .. lnum, 1, true)
    if s and col >= s and col <= e then
      best_file = file
      best_lnum = tonumber(lnum)
      break
    end
  end

  if best_file then
    vim.cmd("edit " .. vim.fn.fnameescape(best_file))
    vim.api.nvim_win_set_cursor(0, { best_lnum, 0 })
  else
    -- fallback to normal gf
    vim.cmd("normal! gF")
  end
end

vim.keymap.set({ "n", "v" }, "gf", gf_with_line, { desc = "Go to file (with line number)" })
vim.keymap.set("i", "<C-w>gf", gf_with_line, { desc = "Go to file (with line number)" })
