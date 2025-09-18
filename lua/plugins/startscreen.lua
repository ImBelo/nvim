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
            ' ▀█████████▄     ▄████████  ▄█        ▄██████▄',  
            '  ███    ███   ███    ███ ███       ███    ███', 
            '  ███    ███   ███    █▀  ███       ███    ███', 
            ' ▄███▄▄▄██▀   ▄███▄▄▄     ███       ███    ███', 
            '▀▀███▀▀▀██▄  ▀▀███▀▀▀     ███       ███    ███', 
            '  ███    ██▄   ███    █▄  ███       ███    ███', 
            '  ███    ███   ███    ███ ███▌    ▄ ███    ███', 
            '▄█████████▀    ██████████ █████▄▄██  ▀██████▀ ', 
                                                          '',
          },
          center = {
            {
              icon = ' ',
              icon_hl = 'group',
              desc = 'Edit config',
              action = 'edit ~/.config/nvim/lua/plugins',
              key = 'c'
            },
            {
              icon = ' ',
              desc = 'Scala         ',
              action = 'edit ~/scala',
              key = 's'
            },
            {
              icon = ' ',
              desc = 'Java          ',
              action = 'edit ~/java',
              key = 'j'
            },
            {
              icon = ' ',
              desc = 'node          ',
              action = 'edit ~/node',
              key = 'n'
            },
            {
              icon = ' ',
              desc = 'Python        ',
              action = 'edit ~/python',
              key = 'p'
            },
            {
              icon = '󱘗 ',
              desc = 'Rust         ',
              action = 'edit ~/rust',
              key = 'r'
            },
            {
              icon = ' ',
              desc = 'C         ',
              action = 'edit ~/c',
              key = 'C'
            },
            {
              icon = 'markdown ',
              desc = 'md         ',
              action = 'edit ~/BancaEuropea/',
              key = 'm'
            },
            {
              icon = '󰒲 ',
              desc = 'Lazy plugins',
              action = 'Lazy',
              key = 'P'
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
              key = 'R'
            },
          },
             footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
       }
      })
    end
  }
}
