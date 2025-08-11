return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'WhoIsSethDaniel/mason-tool-installer.nvim'},
    {'j-hui/fidget.nvim', opts = {}},
    {'folke/lazydev.nvim', opts = {}},
  },
  config = function()
    -- Setup Mason first
    require('mason').setup()

    -- Configure Mason LSP installer
    require('mason-lspconfig').setup({
      ensure_installed = {
        "pyright",
        "lua_ls"  -- Added lua_ls since you're configuring it
      },
      automatic_installation = true,
    })

    -- Configure tools installer (linters/formatters)
    -- NOTE: pyright should NOT be here - it's an LSP server, not a tool
    require('mason-tool-installer').setup({
      ensure_installed = {
        'java-debug-adapter',
        'java-test',
        -- Remove 'pyright' from here
      },
    })

    -- Setup LSP capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    
    -- Common on_attach function
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)  -- Fixed typo: vim not vim
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end
    -- Lua LS configuration (fixed structure)
    require('lspconfig').lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {
              'vim',
              'require',
            },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })

    -- Pyright configuration (fixed structure)
    require('lspconfig').pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
          }
        }
      }
    })
  end
}
