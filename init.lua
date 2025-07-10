-- Set leaders early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Protected require for core config
local function safe_require(name)
  local ok, err = pcall(require, name)
  if not ok then
    vim.notify("Error loading " .. name .. ": " .. err, vim.log.levels.ERROR)
    return false
  end
  return true
end

-- Load core config (immediately)
safe_require("config.options")
safe_require("config.keymaps")

-- Initialize plugins
require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
