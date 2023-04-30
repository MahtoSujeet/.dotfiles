return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- empty setup using defaults
    require("nvim-tree").setup()

    vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
  end
}
