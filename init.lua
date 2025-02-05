local execute = vim.api.nvim_command
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

-- Add error handling to ensure function
local function ensure(user, repo)
    local install_path = fmt("%s/packer/start/%s", pack_path, repo)
    if fn.empty(fn.glob(install_path)) > 0 then
        local success, err = pcall(function()
            execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
            execute(fmt("packadd %s", repo))
        end)
        if not success then
            print(fmt("Failed to install %s: %s", repo, err))
        end
    end
end

-- Plugin manager
ensure("wbthomason", "packer.nvim")

-- Leader key
vim.g.mapleader = ' '
require('keymappings').setup()


-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- Load plugins
require('packer').startup(function(use)
    -- Essential plugins
    use 'wbthomason/packer.nvim'
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }
    -- LSP and completion
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    -- Language specific

    use 'mrcjkb/rustaceanvim'
    use {
        'saecki/crates.nvim',
        config = function()
            require('crates').setup({})
        end,
    }
    use 'fatih/vim-go'

    -- Git integration
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use 'tpope/vim-fugitive'

    -- UI and navigation
    use 'folke/tokyonight.nvim'
    use "nvim-lua/plenary.nvim"
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- AI assistance
    use {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_enabled = true
        end
    }
    -- Quality of life
    use 'numToStr/Comment.nvim'
    -- Dressing configuration
    use {
        'stevearc/dressing.nvim', -- Better UI select/input
        config = function()
            require('dressing').setup({
                input = {
                    enabled = true,
                    override = function(conf)
                        if vim.bo.filetype == "dashboard" then
                            return false
                        end
                        return conf
                    end
                },
                select = {
                    enabled = true,
                    override = function(conf)
                        if vim.bo.filetype == "dashboard" then
                            return false
                        end
                        return conf
                    end
                }
            })
        end
    }

    -- Dashboard configuration
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
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
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        'folke/trouble.nvim',          -- Diagnostic list
        'j-hui/fidget.nvim',           -- LSP progress notifications
        'lvimuser/lsp-inlayhints.nvim' -- Inline type hints
    }


    -- LSP Support
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

-- Theme configuration
vim.cmd [[colorscheme tokyonight]]
vim.cmd [[highlight Normal ctermfg=white ctermbg=black]]

-- LSP Zero configuration
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = 'Format buffer' })
end)

-- Mason and LSP configuration
require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls',
        'lua_ls',
        'solidity',
        'pyright'
    },
    handlers = {
        -- Prevent rust-analyzer from being setup by lspconfig
        ['rust_analyzer'] = function() end,

        -- Handler for all other LSPs
        function(server_name)
            local opts = {}
            if server_name == 'gopls' then
                opts.settings = {
                    gopls = {
                        gofumpt = true,
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                }
            elseif server_name == 'lua_ls' then
                opts.settings = {
                    Lua = {
                        diagnostics = {
                            disable = { "missing-fields", "missing-parameter" },
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                }
            elseif server_name == 'pyright' then
                opts.settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace"
                        }
                    }
                }
            elseif server_name == 'solidity' then
                opts.settings = {
                    solidity = {
                        includePath = "",
                        remapping = {}
                    }
                }
            end
            require('lspconfig')[server_name].setup(opts)
        end,
    },
})

-- Completion configuration
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end),
        ['<CR>'] = cmp.mapping.confirm()
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' }
    }
})



-- Treesitter Configuration
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "lua", "vim", "go", "python",
        "javascript", "typescript", "rust",
        "solidity", "bash", "markdown",
        "markdown_inline", "toml", "yaml"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<Tab>",
            scope_incremental = "<S-Tab>",
            node_decremental = "<BS>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    matchup = {
        enable = true,
    },
})


-- Performance Improvements
vim.opt.hidden = true
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Editor Enhancement Options
vim.opt.scrolloff = 8      -- Keep 8 lines above/below cursor
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "80" -- Show column guide
vim.opt.cursorline = true  -- Highlight current line
vim.opt.wrap = false       -- Disable line wrap

-- Remove auto-commenting on new lines
vim.opt.formatoptions:remove('c')
vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Diagnostic signs
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "🔥",
            [vim.diagnostic.severity.WARN] = "⚠️",
            [vim.diagnostic.severity.HINT] = "💡",
            [vim.diagnostic.severity.INFO] = "ℹ️"
        }
    }
})


-- Telescope Configuration
local telescope = require('telescope')
telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "target",
            "dist",
            ".git"
        },
        mappings = {
            i = {
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
}

-- Global Keymaps
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope git_status<cr>')

-- Enable format on save for Rust files
vim.g.rustfmt_autosave = 1

-- Configure crates.nvim
require('crates').setup({
    null_ls = {
        enabled = true,
        name = "crates.nvim",
    },
    popup = {
        border = "rounded",
    },
})

-- Auto commands for Rust
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

vim.deprecate = function() end
