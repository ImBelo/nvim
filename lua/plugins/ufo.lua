return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost',
  init = function()
    -- Disable ALL UFO autocommands completely
    vim.g.ufo_disable_autocommands = 1
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
      -- Disable all automatic fold behavior
      close_fold_kinds = {},
      open_fold_hl_timeout = 0,
    })

    -- ========== KEYBINDS ========== --
    vim.keymap.set('n', '<Tab>', 'za', { desc = 'Toggle fold under cursor' })
    
    vim.keymap.set('n', '<S-Tab>', function()
      require('ufo').peekFoldedLinesUnderCursor()
    end, { desc = 'Peek folded content' })

    vim.keymap.set('n', 'zj', 'zj', { desc = 'Next fold' })
    vim.keymap.set('n', 'zk', 'zk', { desc = 'Previous fold' })
    vim.keymap.set('n', 'zo', 'zo', { desc = 'Open fold' })
    vim.keymap.set('n', 'zc', 'zc', { desc = 'Close fold' })
    vim.keymap.set('n', 'zO', 'zO', { desc = 'Open all folds at level' })
    vim.keymap.set('n', 'zC', 'zC', { desc = 'Close all folds at level' })

    vim.keymap.set('n', 'zR', function()
      require('ufo').openAllFolds()
    end, { desc = 'Open all folds in file' })

    vim.keymap.set('n', 'zM', function()
      require('ufo').closeAllFolds()
    end, { desc = 'Close all folds in file' })

    -- Disable UFO for special buffers
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'NvimTree', 'toggleterm', 'TelescopePrompt', 'alpha', 'qf' },
      callback = function()
        require('ufo').detach()
      end,
    })
  end
}
