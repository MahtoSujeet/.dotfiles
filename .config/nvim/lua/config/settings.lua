vim.opt.termguicolors = true
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.ignorecase = true
-- vim.opt.smartcase = true
vim.opt.cursorline = true

local tablength = 2
vim.opt.tabstop = tablength
vim.opt.softtabstop = tablength
vim.opt.shiftwidth = tablength
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 3

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Code folding
-- By default all the foldings are open
-- close all = zM
-- toggle one = za
-- open all = zR
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--
-- vim.opt.foldlevel = 999
-- vim.opt.foldnestmax = 4

vim.g.mapleader = " "
