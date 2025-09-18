--- Netrw configuration
vim.g.netrw_altv = 1          -- open splits to the right
-- sets numbers
vim.opt.number = true
-- JetBrainMono font
vim.opt.guifont = "JetBrains Mono:h12"  -- Main setting
-- relative numbers
vim.o.termguicolors = true  -- For true color support
vim.o.background = "dark"   -- ThePrimeagen uses dark mode
vim.opt.relativenumber = true
vim.opt.tabstop = 2      -- Width of tab character
vim.opt.shiftwidth = 2   -- Spaces for auto-indent
vim.opt.softtabstop = 2  -- Spaces inserted when pressing Tab
vim.opt.expandtab = true -- Convert tabs to spaces
-- dashboardsettings
vim.g.dashboard_center_padding = 0
vim.g.dashboard_center_spacing = 2
-- GUI-specific overrides
if vim.g.neovide then
  vim.g.neovide_font_size = 12
end
