require("gitsigns").setup({
    --[[ signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '-' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = 'u' },
  }, ]]

    current_line_blame_opts = {
        delay = 0,
    },

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        -- binds
        map("n", "<leader>b", function()
            gs.toggle_linehl()
            gs.toggle_numhl()
            gs.toggle_current_line_blame()
        end, { desc = "blame" })
    end,
})
