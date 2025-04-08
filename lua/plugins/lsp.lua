require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'pyright' },
  automatic_installation = true, -- Automatically install servers
})

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
  function(server_name)
    if server_name == 'rust_analyzer' then
      return -- Skip rust_analyzer setup (handled by rustaceanvim)
    end
    lspconfig[server_name].setup({})
  end,
})
