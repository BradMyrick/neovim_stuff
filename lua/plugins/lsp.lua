require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls', 'pyright' }, -- Add your desired language servers
  automatic_installation = true, -- Automatically install servers
})

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
  function(server_name) -- Default handler
    lspconfig[server_name].setup({})
  end,
})
