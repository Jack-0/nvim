return { -- indent lines ...
    "lukas-reineke/indent-blankline.nvim",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        -- indent = {
        --     char = ".",
        --     tab_char = ".",
        -- },
        scope = { enabled = false },
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
            },
        },
    },
    main = "ibl",
}
