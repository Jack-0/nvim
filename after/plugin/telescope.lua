local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- search all
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- find git files (Ctrl-p)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end) 
