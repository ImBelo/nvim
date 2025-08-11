-- lua/plugins/notify.lua
return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      timeout = 5000,  -- 5-second display
    background_colour = "#000000",
      stages = 'fade_in_slide_out'
    })
    vim.notify = require('notify')
  end
}
