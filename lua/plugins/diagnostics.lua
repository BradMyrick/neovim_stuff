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

require('trouble').setup({
  icons = false,
  signs = {
    error = "🔥",
    warning = "⚠️",
    hint = "💡",
    information = "ℹ️"
  }
})
