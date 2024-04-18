return {
  "terrortylor/nvim-comment",
  event = "BufEnter",
  config = function()
    require("nvim_comment").setup()
  end
}
