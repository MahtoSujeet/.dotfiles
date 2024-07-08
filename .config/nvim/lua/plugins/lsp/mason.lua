return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    {'williamboman/mason.nvim', opts = {}},
    {'neovim/nvim-lspconfig'},
  },
  -- lazy says use opts={} instead of config=function() req("p").setup{}
  opts = {
      handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
      },
  },
}
