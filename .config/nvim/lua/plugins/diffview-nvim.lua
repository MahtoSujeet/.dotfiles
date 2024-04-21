return {
  "sindrets/diffview.nvim",
  lazy = true,
  cmd = { "DiffviewOpen" },
  keys = { "<leader>gd" },
  config = function()
    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<cr>")

    -- For dotfiles
    -- vim.env.GIT_WORK_TREE = vim.fn.expand("~")
    -- vim.env.GIT_DIR = vim.fn.expand("~/.dotfiles")
  end
}
