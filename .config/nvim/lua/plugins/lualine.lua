return {
  'nvim-lualine/lualine.nvim',
  event = "VimEnter",
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup()
  end,
}
