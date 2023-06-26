-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- see :help  nvim-tree
require("nvim-tree").setup({
    update_cwd = true,
    open_on_setup = true,
    open_on_setup_file = true,
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    view = {
        side = "left",
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    filters = {
        dotfiles = false,
    },
    renderer = {
        icons = {
            glyphs = {
                git = {
                    ignored = "i",
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                },
            },
        },
    },

    git = {
        ignore = false,
    },
})