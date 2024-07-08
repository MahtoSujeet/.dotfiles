return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'VonHeikemen/lsp-zero.nvim',branch = 'v3.x'},
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
    },
    {'saadparwaiz1/cmp_luasnip'},
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    -- lsp-zero
    local lsp_zero = require('lsp-zero')
    local cmp = require'cmp'
    local cmp_action = require('lsp-zero').cmp_action()
    local cmp_format = require('lsp-zero').cmp_format({details = true})


    -- lsp_zero.format_on_save({
    --   format_opts = {
    --     async = false,
    --     timeout_ms = 10000,
    --   },
    -- })


    -- lsp_attach is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      -- not working
      lsp_zero.buffer_autoformat()

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),

      -- custom config for lsp-servers
      require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls()),
      require("lspconfig").bashls.setup({
        filetypes = { "sh", "zsh" },
    })
    })



    -- cmp
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },

      mapping = cmp.mapping.preset.insert({
         ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' },
      }),
      --- (Optional) Show source name in completion menu
      formatting = cmp_format,
      experimental = {
        ghost_text = true,
      },
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      })
    })
    require("cmp_git").setup() ]]-- 

  end,

}
