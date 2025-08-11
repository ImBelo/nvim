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
        "pyright"
      },
      automatic_installation = true, -- Auto-install missing servers
    })

    -- Configure tools installer (linters/formatters)
    require('mason-tool-installer').setup({
      ensure_installed = {
        'java-debug-adapter',
        'java-test',
      },
    })

    -- Setup LSP capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    
    -- Common on_attach function
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end

    vim.lsp.config('lua_ls', {
      settings = {
        capabilities = capabilities,
        on_attach = on_attach,
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
        },
      },
    })
    vim.lsp.config('pyright', {
      settings = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings= {
          python = {
            analysis = {
              typeCheckingMode = "basic",  -- "off", "basic", "strict"
              autoSearchPaths = true,
              diagnosticMode = "workspace", -- "openFilesOnly" or "workspace"
              useLibraryCodeForTypes = true,
            }
          }
        }
      }



    })


    -- Optional: Auto-install tools on startup
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        vim.cmd('MasonToolsInstall')
      end
    })
  end
}
