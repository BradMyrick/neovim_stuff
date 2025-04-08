local ensure_packer = function()
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Language stuff
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
    -- Rust specific tools
  use {
    'mrcjkb/rustaceanvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap', -- For debugging support
    },
    ft = 'rust', -- Only load for Rust files
  }
  use 'saecki/crates.nvim'
  use 'fatih/vim-go'

    -- Core Utilities
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'windwp/nvim-autopairs'


  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
  }  
  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Github
  use 'github/copilot.vim'
  use 'j-hui/fidget.nvim'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Themes
  use 'stevearc/dressing.nvim'
  use {
    'glepnir/dashboard-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.dashboard')
    end
  }
  use 'folke/trouble.nvim'
  use 'lvimuser/lsp-inlayhints.nvim'
  use 'folke/tokyonight.nvim'
  
  -- LSP Zero
  use 'williamboman/mason.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
