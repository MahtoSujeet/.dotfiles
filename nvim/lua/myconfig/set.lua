vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
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

vim.g.mapleader = " "

-- Better Netrw
-- vim.g.netrw_banner = 0    -- Hide banner
-- vim.g.netrw_winsize = 75
-- vim.g.netrw_altv = 2      -- Open with right splitting
-- vim.g.netrw_liststyle = 3 -- Tree-style view
-- -- use .gitignore
-- vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]]
