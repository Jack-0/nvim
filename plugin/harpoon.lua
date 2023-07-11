local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file"})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Show harpooned files"})

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, {desc = "Harpoon nav 1"})
-- vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, {desc = "Harpoon nav 2"})
-- vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, {desc = "Harpoon nav 3"})
-- vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, {desc = "Harpoon nav 4"})