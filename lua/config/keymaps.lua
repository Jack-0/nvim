-- keymaps are automatically loaded on the VeryLazy event
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move code up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected down" })

-- Y yanks to os clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to OS clipboard" })

-- set Q to null, :help Q
vim.keymap.set("n", "Q", "<nop>", { desc = "<nop>" })

-- find and replace current selected word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace word" })

-- open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Ex (project view)" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

-- terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]]) -- allow ESC in terminal?
-- vim.keymap.set("n", "<leader>t", "<cmd>below 20split +terminal<CR>", { desc = "open terminal" })


-- TELESCOPE

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set("n", "<leader><space>", function() require('telescope.builtin').git_files({ show_untracked = true }) end,
  { desc = "find git files" })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'search files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'search help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'search current word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'search grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'search diagnostics' })


-- TREE_SITTER?
-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- UNDO TREE
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndoTree" })



-- nvim tree toggle
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle, { desc = "project tree view"})