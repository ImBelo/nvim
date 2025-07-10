return {
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup({
        theme = 'doom',
        config = {
          header = {
            '',
            ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
            '',
          },
          center = {
            {
              icon = ' ',
              desc = 'Edit config',
              action = 'edit ~/.config/nvim/init.lua',
              key = 'c'
            },
            {
              icon = '󰒲 ',
              desc = 'Lazy plugins',
              action = 'Lazy',
              key = 'p'
            },
            {
              icon = '󰊳 ',
              desc = 'Update plugins',
              action = 'Lazy update',
              key = 'u'
            },
            {
              icon = ' ',
              desc = 'Find files',
              action = 'Telescope find_files',
              key = 'f'
            },
            {
              icon = '󰈚 ',
              desc = 'Recent files',
              action = 'Telescope oldfiles',
              key = 'r'
            },
          },
          footer = { '' } -- Empty footer
        }
      })
    end
  }
}
