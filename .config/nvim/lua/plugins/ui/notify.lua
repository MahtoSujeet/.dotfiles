return {
  "rcarriga/nvim-notify",
  enabled = false,
  config = function()
    vim.notify = require("notify")
  end
}
