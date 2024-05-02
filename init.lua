local execute = vim.api.nvim_command
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

local function ensure(user, repo)
    local install_path = fmt("%s/packer/start/%s", pack_path, repo)
    if fn.empty(fn.glob(install_path)) > 0 then
        execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
        execute(fmt("packadd %s", repo))
    end
end
--  plugin manager
ensure("wbthomason", "packer.nvim")
-- leader key
vim.g.mapleader = ' '
-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- Load plugins
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'fatih/vim-go'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'folke/tokyonight.nvim'
    use "nvim-lua/plenary.nvim"
    use 'nvim-tree/nvim-web-devicons'
    use {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_enabled = true
        end
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'tpope/vim-fugitive'
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                config = {
                    project = { enable = false },
                    header = {
                        '  ██   ██  ██████  ██████  ██████  ',
                        '  ██  ██  ██    ██ ██   ██ ██   ██ ',
                        '  █████   ██    ██ ██   ██ ██████  ',
                        '  ██  ██  ██    ██ ██   ██ ██   ██ ',
                        '  ██   ██  ██████  ██████  ██   ██ ',
                        '',
                    },
                }
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
end)

-- Theme
vim.cmd [[colorscheme tokyonight]]
vim.opt.termguicolors = true
vim.cmd [[highlight Normal ctermfg=white ctermbg=black]]

-- Load keymaps
require('keymappings')
-- Setup mason and mason-lspconfig
require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'golangci_lint_ls', 'pyright', 'gopls', 'lua_ls' },
    handlers = { function(server_name)
        local opts = {}
        if server_name == 'gopls' then
            opts.settings = {
                gopls = {
                    gofumpt = true, -- Enable gofumpt formatting (or use 'goimports' if preferred)
                },
            }
        elseif server_name == 'pyright' then
            opts.settings = {
                python = {
                    formatting = {
                        provider = 'autopep8',
                        autopep8Path = '/usr/bin/autopep8',
                    },
                },
            }
        elseif server_name == 'lua_ls' then
            opts.settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    format = {
                        enable = true,
                        -- Use the default formatting options for stylua
                        defaultConfig = {
                            indent_style = 'space',
                            indent_size = 2,
                        },
                    },
                },
            }
        end
        require('lspconfig')[server_name].setup(opts)
    end,
    },
})

-- Setup lsp-zero
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end,
        { buffer = bufnr, desc = 'Format buffer' })
end)
require 'lspconfig'.golangci_lint_ls.setup {}
