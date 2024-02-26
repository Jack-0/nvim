-- keymaps are automatically loaded on the VeryLazy event
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("config.keymaps")
require("config.options")
require("config.autocmds")
