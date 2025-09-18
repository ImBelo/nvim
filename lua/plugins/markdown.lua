return {
  -- Markdown Preview with proper math support
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_browser = 'google-chrome'
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_math = 1
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {
          js = 'https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js',
          css = 'https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css'
    },
        uml = {
          js = 'https://cdn.jsdelivr.net/npm/mermaid@10.6.1/dist/mermaid.min.js',
          css = 'https://cdn.jsdelivr.net/npm/mermaid@10.6.1/dist/mermaid.min.css'
        }
      }
      -- Keymaps
      vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { desc = '[M]arkdown [P]review' })
      vim.keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<CR>', { desc = '[M]arkdown [S]top' })
    end,
  },

  -- Obsidian.nvim setup
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Machine Learning",
          path = "~/BancaEuropea/Machine Learning/",
        },
        {
          name = "Reti di calcolatori",
          path = "~/BancaEuropea/Reti di calcolatori/",
        },
      },
    }
  },

  -- Render-markdown.nvim (CORRECT configuration)
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      -- This plugin mainly handles concealing markdown syntax in Neovim
      -- It doesn't have extensive math configuration options
      markers = {
        enabled = true,  -- Render headings, quotes, etc.
        list = true,     -- Render list markers
      },
      code = {
        enabled = true,  -- Render code blocks
      },
    }
  },
}
