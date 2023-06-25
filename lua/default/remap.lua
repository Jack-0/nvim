vim.g.mapleader = " "

-- move code up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Y yanks to os clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- set Q to null, :help Q
vim.keymap.set("n", "Q", "<nop>")

-- find and replace current selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- open netrw
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- rename defintion, note require :wa to enact
local rd = require("custom.renameDefinition");
vim.keymap.set("n", "<leader>rd", rd.rename)
--vim.keymap.set("n", "<leader>rd", vim.lsp.buf.rename)

local hw = require("custom.helloWorld")
vim.keymap.set("n", "<leader>kc", hw.helloWorld)
