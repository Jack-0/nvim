local builtin = require("telescope.builtin")

--builtin.git_files({show_untracked = true})

-- search all
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "search files" })
vim.keymap.set("n", "<leader>ss", builtin.grep_string, { desc = "search selected" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "search help" })
vim.keymap.set("n", "<C-p>", function() builtin.git_files({ show_untracked = true }) end, { desc = "find git files" })

vim.keymap.set("n", "<leader>sp", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "search project" })
