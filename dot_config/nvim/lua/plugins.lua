return require("packer").startup(function()
  -- Package manager
  use "wbthomason/packer.nvim"
  -- Enable Lsp
  use "neovim/nvim-lspconfig"
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
end)
