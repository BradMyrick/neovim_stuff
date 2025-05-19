-- Load core configurations first
require('core.options')
require('core.keymaps')

-- Initialize plugin manager and plugins
require('core.plugins')

-- Load plugin configurations AFTER packer
vim.cmd [[packadd packer.nvim]]
vim.schedule(function()
  require('nvim-web-devicons').setup()
  require('plugins.dashboard')    -- Your KODR splash
  require('plugins.diagnostics')  
  require('plugins.lsp')         
  require('plugins.telescope')    

  -- Theme
  vim.cmd [[colorscheme tokyonight]]
  vim.cmd [[highlight Normal ctermfg=white ctermbg=black]]
end)

vim.opt.clipboard = "unnamedplus"
