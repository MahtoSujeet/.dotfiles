return {
  "sindrets/diffview.nvim",
  config = function()
    vim.keymap.set("n", "<leader>g", ":DiffviewOpen<cr>")
  end
}
