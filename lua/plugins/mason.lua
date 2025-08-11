return {
  "williamboman/mason.nvim",
  dependencies = {
    -- Add this line to include mason-tool-installer
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = "Mason",
  opts = {
    -- List of servers to automatically install
    ensure_installed = {
      -- LSP
      "pyright",          -- Python
      "jdtls",            -- Java
      "rust_analyzer",    -- Rust
      "typescript-language-server",         -- TypeScript/JavaScript
      "lua_ls",           -- Lua
      -- Formatters
      "black",            -- Python
      "prettier",         -- JS/TS
      "stylua",           -- Lua
      -- Linters
      "eslint_d",         -- JavaScript
      "flake8",           -- Python
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    
    -- Auto-install configured servers on startup
    vim.schedule(function()
      require("mason-tool-installer").setup({
        ensure_installed = opts.ensure_installed,
        auto_update = true,
      })
    end)
  end
}
