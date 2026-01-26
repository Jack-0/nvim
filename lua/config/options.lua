-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- use :help '<option>' i.e help 'wrap'

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- options are automatically loaded before lazy.nvim startup

vim.opt.clipboard:append 'unnamed' -- share clipboard (unamed is macOS specific)

-- netrw
vim.g.netrw_liststyle = 3 -- netrw tree style
vim.g.netrw_banner = 0

--vim.opt.nu = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.o.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 12

-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

--vim.opt.colorcolumn = "80" -- show column at 80

vim.opt.spell = true -- underlines spelling errors, looks odd with certain themes

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Save undo history

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
-- vim.o.updatetime = 250
-- vim.o.timeout = true
-- vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- add filetypes
-- vim.filetype.add({ extension = { templ = "templ" } }) -- enables htmx golang templ files
