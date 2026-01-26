return { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            local gs = require('gitsigns')
            local opts = { buffer = bufnr }

            -- Navigation (with wrap to cycle through hunks)
            vim.keymap.set('n', ']c', function()
                gs.nav_hunk('next', { wrap = true })
            end, opts)
            vim.keymap.set('n', '[c', function()
                gs.nav_hunk('prev', { wrap = true })
            end, opts)
        end,
    },
}
