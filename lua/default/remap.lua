vim.g.mapleader = " "

-- move code up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected down" })

-- Y yanks to os clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to OS clipboard" })

-- set Q to null, :help Q
vim.keymap.set("n", "Q", "<nop>", { desc = "<nop>" })

-- find and replace current selected word
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Find and replace word" }
)

-- open netrw
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- rename defintion, note require :wa to enact
local rd = require("custom.renameDefinition")
vim.keymap.set("n", "<leader>rd", rd.rename, { desc = "Rename defintion" })
--vim.keymap.set("n", "<leader>rd", vim.lsp.buf.rename)

local hw = require("custom.helloWorld")
vim.keymap.set("n", "<leader>kc", hw.helloWorld, { desc = "Print boo2" })
