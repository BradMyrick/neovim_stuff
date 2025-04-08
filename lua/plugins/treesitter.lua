require('nvim-treesitter.configs').setup {
    ensure_installed = {'lua', 'python', 'go', 'rust'}, -- Add languages
    highlight = {enable = true},
    indent = {enable = true},
  }
  