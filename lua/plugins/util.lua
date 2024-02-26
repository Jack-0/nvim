return {
    -- tmux, allows <C-[hjkl]> pane navigation in nvim
    { 'christoomey/vim-tmux-navigator' },

    -- detect tabstop and shiftwidth automatically
    { "tpope/vim-sleuth" },

    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        init = function()
            -- TODO: review
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },

    -- automatic tags i.e <p/>
    { "windwp/nvim-ts-autotag" },

    -- undo tree
    { "mbbill/undotree" },

    -- which key
    {
        "folke/which-key.nvim",
        plugins = { spelling = true },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    }
}
