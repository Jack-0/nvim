local ntree = require("nvim-tree")
ntree.setup()

vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle, { desc = "project tree view"})
