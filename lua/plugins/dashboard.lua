require('dashboard').setup {
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '    ██╗  ██╗ ██████╗ ██████╗ ██████╗     ',
      '    ██║ ██╔╝██╔═══██╗██╔══██╗██╔══██╗    ',
      '    █████╔╝ ██║   ██║██║  ██║██████╔╝    ',
      '    ██╔═██╗ ██║   ██║██║  ██║██╔══██╗    ',
      '    ██║  ██╗╚██████╔╝██████╔╝██║  ██║    ',
      '    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝    ',
      '',
      ' ☕ input coffee, output code ☕ ',
      '',
    },
      center = {
        {
            icon = '🔍 ',
            icon_hl = 'Title',
            desc = 'Find File',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            action = 'Telescope find_files'
        },
        {
            icon = '🔎 ',
            desc = 'Search Text',
            key = 's',
            action = 'Telescope live_grep'
        },
        {
            icon = '🔧 ',
            desc = 'Recent Projects',
            key = 'p',
            action = 'Telescope projects'
        },
        {
            icon = '⚡ ',
            desc = 'New File',
            key = 'n',
            action = 'enew'
        },
        {
            icon = '🔨 ',
            desc = 'Config',
            key = 'c',
            action = 'e ~/.config/nvim/init.lua'
        },
        {
            icon = '💻 ',
            desc = 'Terminal',
            key = 't',
            action = 'terminal'
        }
    },
    footer = {
      '',
      '⚡ Powered by Neovim ' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch,
      '👨‍💻 ' .. os.getenv('USER') .. ' @ ' .. vim.fn.hostname()
    }
  }
}
