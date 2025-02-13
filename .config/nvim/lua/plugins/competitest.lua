return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      testcases_use_single_file = true,
    })

    local set = vim.keymap.set

    set("n", "<leader>pr", "<cmd>CompetiTest run<CR>")
    set("n", "<leader>pt", "<cmd>CompetiTest receive testcases<CR>")
    set("n", "<leader>pp", "<cmd>CompetiTest receive problem<CR>")
    set("n", "<leader>pc", "<cmd>CompetiTest receive contest<CR>")
  end,
}
