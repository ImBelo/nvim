return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent = true,  -- Keep if you want transparency
        contrast = "hard",
        overrides = {
          -- Optional: Customize specific highlights to match his style
          Function = { fg = "#458588" },  -- Blue functions
          Keyword = { fg = "#fb4934" },   -- Red keywords
        }
      })
      vim.cmd.colorscheme("gruvbox")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    end
  }
}
