return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Mason for LSP installation
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      
      -- Required for capabilities
      { "hrsh7th/cmp-nvim-lsp" },  -- <-- THIS IS THE MISSING DEPENDENCY
      
      -- Other LSP-related plugins
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/neodev.nvim", opts = {} }
    },
    config = function()
      -- Initialize modules
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      
      -- IMPORTANT: Now cmp_nvim_lsp will be available
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup Mason first
      require("mason").setup()
      mason_lspconfig.setup({
        ensure_installed = { "jdtls", "tsserver", "lua_ls" }, -- Example servers
        automatic_installation = true,
      })

      -- LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- Setup handlers with capabilities
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["jdtls"] = function() end, -- Skip default setup if using custom config
      })
    end
  },

  -- Autocompletion Setup (must come after LSP)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP completion source
      "hrsh7th/cmp-buffer",     -- Buffer words
      "hrsh7th/cmp-path",       -- Filesystem paths
      "L3MON4D3/LuaSnip",       -- Snippet engine
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  }
}
