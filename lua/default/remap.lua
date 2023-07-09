
-- move code up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected down" })

-- Y yanks to os clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to OS clipboard" })

-- set Q to null, :help Q
vim.keymap.set("n", "Q", "<nop>", { desc = "<nop>" })

-- find and replace current selected word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace word" })

-- open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Ex (project view)" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

-- terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]]) -- allow ESC
vim.keymap.set("n", "<leader>t", "<cmd>below 20split +terminal<CR>", { desc = "open terminal" })
