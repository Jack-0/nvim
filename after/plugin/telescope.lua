--require('telescope').setup{
--    git_files = {
--        show_untracked = true
--    }
--}

local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- include untracked files in git view
--builtin.git_files({show_untracked = true})

-- search all
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "[P]roject [F]iles"})


vim.keymap.set('n', '<leader>gs', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>gh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })


-- find git files (Ctrl-p)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--vim.keymap.set('n', '<leader>pg', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end) 
