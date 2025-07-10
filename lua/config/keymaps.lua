local map = vim.keymap.set

-- Leader key (default is <Space>)
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<ESC>', {
  noremap = true,
  silent = true,
  expr = false,
  nowait = true
})
-- Optional: Adjust timeout length (default is 1000ms)
vim.opt.timeoutlen = 200
-- File Explorer
map("n", "<leader>e", "<cmd>:Ex<cr>", { desc = "Toggle Explorer" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
