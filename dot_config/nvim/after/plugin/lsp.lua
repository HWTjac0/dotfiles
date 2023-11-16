require('mason').setup({
  ui = {
    border = 'rounded'
  }
})


local lsp = require("lsp-zero")

require("lspconfig").emmet_language_server.setup {
  filetypes = {"html", "php"}
}

require("lspconfig").texlab.setup {
  build = {
    onSave = true
  }
}

require("lspconfig").phpactor.setup {
}

lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
  'phpactor'
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
