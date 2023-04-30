local set = vim.keymap.set

vim.g.mapleader = " "
set("n", "<leader>e", vim.cmd.Ex)
set("i", "jk", "<esc>")
set("i", "kj", "<esc>")

-- save the buffer
set("n", "<c-s>", ":w<cr>")
set("i", "<c-s>", "<esc>:w<cr>")
set("n", "<leader>q", ":q!<cr>")

-- To open config file
set("n", "<leader>nc", ":tabnew ~/.config/nvim/<cr>")
