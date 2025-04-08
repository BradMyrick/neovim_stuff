local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = ' '

-- Basic mappings
map('n', '<leader>pv', vim.cmd.Ex, opts)
map('n', '<leader>w', '<cmd>w<CR>', opts)
map('n', '<leader>q', '<cmd>q<CR>', opts)

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>fs', '<cmd>Telescope git_status<cr>', opts)

-- LSP
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'gr', vim.lsp.buf.references, opts)
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map('n', '<leader>f', vim.lsp.buf.format, opts)

-- Git (Fugitive)
map('n', '<leader>gs', vim.cmd.Git, opts)
map('n', '<leader>gd', vim.cmd.Gdiffsplit, opts)
map('n', '<leader>gp', function() vim.cmd.Git('pull') end, opts)
map('n', '<leader>gu', function() vim.cmd.Git('push') end, opts)
map('n', '<leader>gc', function() vim.cmd.Git('commit') end, opts)

-- Buffer management
map('n', '<leader>q', vim.cmd.bdelete, opts)
map('n', '<leader>n', vim.cmd.enew, opts)

-- Window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Custom Copy Paste
map("v", "<C-c>", '"+y') -- Copy in visual mode
map("v", "<C-x>", '"+d') -- Cut in visual mode
map({"i", "n"}, "<C-v>", "<C-r>+") -- Paste in insert mode

-- Move to start/end of line
map("n", "<leader>h", "0", opts)  
map("n", "<leader>l", "$", opts)

-- Terminal keymaps
map('n', '<leader>t', ':terminal<CR>', opts) -- Open terminal from normal mode
map('t', '<Esc>', [[<C-\><C-n>]], opts)      -- Close terminal from terminal mode

-- Jump back to previous file
map('n', '<leader><leader><leader>', [[<C-^>]], opts)
