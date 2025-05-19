local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    on_attach = function(client, bufnr)
      -- Enable inlay hints (matching your original config)
      vim.lsp.inlay_hint.enable(false)
      
      -- Keymaps from sharksforarms guide
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = true,
        imports = { granularity = { group = "module" } },
        cargo = { buildScripts = { enable = true } },
        procMacro = { enable = true }
      }
    }
  },
  tools = {
    inlay_hints = { auto = true }  -- Enable automatic inlay hints
  }
})
