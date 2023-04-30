return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  -- or                            , branch = '0.1.x',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  -- keys = {
  --   -- local builtin = require('telescope.builtin'),
  --   { '<leader>ff', require('telescope.builtin').find_files }
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
  end
}
