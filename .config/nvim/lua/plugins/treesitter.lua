return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  build = ':TSUpdate',
  config = function()
    -- require("nvim-treesitter.install").prefer_git = true
    require 'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "javascript", "lua", "html", "css", "gitignore" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- prefer_git = true,

      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    }
  end
}
