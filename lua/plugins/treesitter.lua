return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = true,
        ensure_installed = {
          -- Core languages
          "c",
          "java",
          "javascript",
          "typescript",
          "python",
          "rust",
          
          -- Web development
          "tsx",
          "jsdoc",
          "html",
          "css",
          
          -- Jupyter/Data science
          "json",
          "markdown",
          
          -- Supporting syntax
          "bash",
          "regex",
          "yaml",
          "toml",
          
          -- Always useful
          "lua",
          "vim",
          "vimdoc",
          "query"
        },
        
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        
        incremental_selection = { enable = true },
        indent = { enable = true },
        playground = { enable = true },
        
        markid = { enable = true },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
          config = {
            python = "# %s",
            julia = "# %s",
            scala = "// %s"
          }
        }
      })
      
      vim.opt.runtimepath:prepend("~/.local/share/nvim/treesitter-parsers")
    end
  }
}
