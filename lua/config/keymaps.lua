local map = vim.keymap.set

-- Leader key (default is <Space>)
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<ESC>', {
  noremap = true,
  silent = true,
  expr = false,
  nowait = true
})
-- Toggle current fold with <Tab>
-- Only set the mapping AFTER ufo loads
vim.api.nvim_create_autocmd('User', {
  pattern = 'UfoAttached',  -- Or your plugin manager's loaded event
  callback = function()
    vim.keymap.set('n', '<Tab>', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.cmd('normal! za')
      end
    end, { desc = 'Toggle fold' })
  end
})

-- Toggle all folds with <S-Tab>
vim.keymap.set('n', '<S-Tab>', function()
  if require('ufo').getFoldedFolds() > 0 then
    require('ufo').openAllFolds()
  else
    require('ufo').closeAllFolds()
  end
end, { desc = 'Toggle all folds' })
vim.opt.timeoutlen = 200
map('n', 'zR', function()
  require('ufo').openAllFolds()
end, { desc = 'Open all folds' })

map('n', 'zM', function()
  require('ufo').closeAllFolds()
end, { desc = 'Close all folds' })

map('n', 'zr', function()
  require('ufo').openFoldsExceptKinds()
end, { desc = 'Fold less (open more)' })

map('n', 'zm', function()
  require('ufo').closeFoldsWith()
end, { desc = 'Fold more (close more)' })

map('n', 'zp', function()
  require('ufo').peekFoldedLinesUnderCursor()
end, { desc = 'Peek fold content' })
-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })
-- LSP
map('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
map('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')
