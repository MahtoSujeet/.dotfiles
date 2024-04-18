return {
  "sindrets/diffview.nvim",
  lazy = true,
  config = function()
    vim.keymap.set("n", "<leader>g", ":DiffviewOpen<cr>")

    -- For dotfiles
    vim.env.GIT_WORK_TREE = vim.fn.expand("~")
    vim.env.GIT_DIR = vim.fn.expand("~/.dotfiles")
  end
}
