return {
    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- See `:help telescope` and `:help telescope.setup()`
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                        },
                    },
                    horizontal = {
                        width = 0.5
                    },
                },
            }

            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')
            local builtin = require 'telescope.builtin'


            -- See `:help telescope.builtin`
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

            vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
                { desc = '[?] Find recently opened files' })
            vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })
            vim.keymap.set("n", "<leader><space>",
                function() require('telescope.builtin').git_files({ show_untracked = true }) end,
                { desc = "find git files" })
            vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'search files' })
            vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'search help' })
            vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'search current word' })
            vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'search grep' })
            vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'search diagnostics' })
        end
    },

    -- telescope file explorer
    -- {
    --     "nvim-telescope/telescope-file-browser.nvim",
    --     dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    --     config = function()
    --         require("telescope").load_extension("file_browser")
    --     end
    -- },

}
