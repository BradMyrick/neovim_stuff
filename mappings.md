vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

-- Show references 
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

-- Rename symbol
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

-- Show hover information
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

-- Format buffer
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)

-- Git status
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)  
-- Open changed files in git 
vim.keymap.set('n', '<leader>gd', vim.cmd.Gdiffsplit)

-- Git pull 
vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git('pull') end)

-- Git push
vim.keymap.set('n', '<leader>gu', function() vim.cmd.Git('push') end) 

-- Git push
vim.keymap.set('n', '<leader>gc', function()
      vim.cmd('Git commit')
  end)

-- Save current buffer
vim.keymap.set('n', '<leader>w', vim.cmd.write)

-- Close current buffer
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)

-- Open new file
vim.keymap.set('n', '<leader>n', vim.cmd.enew)

-- Navigate between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j') 
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Custom Copy Paste
vim.keymap.set("v", "<C-c>", '"+y') -- Copy in visual mode
vim.keymap.set("v", "<C-x>", '"+d') -- Cut in visual mode

vim.keymap.set({"i", "n"}, "<C-v>", "<C-r>+") -- Paste in insert mode

vim.keymap.set('n', '<leader><leader>a', ':%y+<CR>', {noremap = true, silent = true})

-- Move to start of line --
vim.keymap.set("n", "<leader>h", "0")  
-- move to end of line --
vim.keymap.set("n", "<leader>l", "$")
-- Move to first non-blank line --
vim.keymap.set("n", "<leader>j", "^")


local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
           lsp_zero.default_keymaps({buffer = bufnr})
           end)
require'lspconfig'.golangci_lint_ls.setup{}

-- Terminal keymaps --
-- Open terminal from normal mode
vim.keymap.set('n', '<leader>t', ':terminal<CR>', {noremap = true, silent = true})
-- Close terminal from terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})
-- jump back to previous file 
vim.keymap.set('n', '<leader><leader><leader>', '<C-^>', {noremap = true, silent = true})
