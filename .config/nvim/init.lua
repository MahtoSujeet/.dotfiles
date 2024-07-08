-------------------------------------------------
-- Install lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy requires leaderkey to be mapped
vim.g.mapleader = " "

------------------------------------------------

require("myconfig")
-- Add any directory that you want to auto import
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
  }
})
require("after.plugins")
