require('mason').setup({
  ui = {
    border = 'rounded'
  }
})


local lsp = require("lsp-zero")

require("lspconfig").emmet_language_server.setup {
  filetypes = { "html", "php" }
}

require("lspconfig").texlab.setup {
  build = {
    onSave = true
  }
}

require("lspconfig").phpactor.setup {
}

require("lspconfig").tsserver.setup {
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = 'non-relative'
    },
  },
}

lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
  'phpactor'
})

lsp.setup()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
})
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
