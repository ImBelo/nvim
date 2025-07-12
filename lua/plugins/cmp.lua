return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer', -- buffer completions
      'hrsh7th/cmp-path', -- path completions
      'hrsh7th/cmp-nvim-lsp', -- LSP completions
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        completion = {
          autocomplete = false, -- Turns off automatic popup
        },
        snippet = {
          expand = function(args)
            -- You can add snippet engine here if needed (like vsnip or luasnip)
          end,
        },
         mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
          }),
          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
       },
        formatting = {
          format = function(_, vim_item)
             vim.cmd("packadd lspkind-nvim")
             vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]
             .. "  "
             .. vim_item.kind
             return vim_item
          end,
       },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- LSP
          { name = "vsnip" },
          { name = 'path' }, -- File system paths
        }),
      })
    end,
  },
}
