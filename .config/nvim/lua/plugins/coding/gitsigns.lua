return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  config = true,
  keys = {
    { "<leader>hp", "<cmd>Gitsigns preview_hunk_inline<cr>" },
    { "<leader>hn", "<cmd>Gitsigns next_hunk<cr>" },
    { "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>" },
    { '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>' },
    { '<leader>hd', '<cmd>Gitsigns diffthis<CR>' },
    { '<leader>hb', '<cmd>Gitsigns toggle_current_line_blame<CR>' },
  },
}
