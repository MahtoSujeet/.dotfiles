return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup()

    local set = vim.keymap.set

    set('n', '<leader>cr', "<cmd>CompetiTest run<CR>")
    set('n', '<leader>ct', "<cmd>CompeTiTest recieve testcases<CR>")
    set('n', '<leader>cp', "<cmd>CompeTiTest recieve problem<CR>")
    set('n', '<leader>cc', "<cmd>CompeTiTest recieve contest<CR>")
  end
}
