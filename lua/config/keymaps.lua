local map = vim.keymap.set

-- Leader key (default is <Space>)
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<ESC>', {
  noremap = true,
  silent = true,
  expr = false,
  nowait = true
})

vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-d>", "5jzz")
vim.keymap.set("n", "<C-u>", "5kzz")

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
map('n', '<leader>gc', ':terminal latexmk -pdf -interaction=nonstopmode %<CR>')
-- VimTeX Keymaps
-- Compilation
vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompile<cr>', { desc = '[C]ompile (once)' })
vim.keymap.set('n', '<leader>lC', '<cmd>VimtexClean<cr>', { desc = '[C]lean build files' })
vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompileToggle<cr>', { desc = 'Compile [L]oop Toggle (continuous)' })
vim.keymap.set('n', '<leader>lo', '<cmd>VimtexCompileOutput<cr>', { desc = 'Show Compiler [O]utput' })

-- Viewing
vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<cr>', { desc = '[V]iew PDF' })
vim.keymap.set('n', '<leader>ls', '<cmd>VimtexForwardSearch<cr>', { desc = 'Forward [S]earch' })

-- Information
vim.keymap.set('n', '<leader>li', '<cmd>VimtexInfo<cr>', { desc = '[I]nfo' })
vim.keymap.set('n', '<leader>lI', '<cmd>VimtexInfoAll<cr>', { desc = '[I]nfo (all)' })
vim.keymap.set('n', '<leader>lt', '<cmd>VimtexTocToggle<cr>', { desc = '[T]able of Contents' })
vim.keymap.set('n', '<leader>lT', '<cmd>VimtexTocOpen<cr>', { desc = '[T]able of Contents (open)' })

