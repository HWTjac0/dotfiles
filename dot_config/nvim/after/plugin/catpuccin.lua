require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    cmp = true,
    nvimtree = true,
    treesitter = true
  }
})

vim.cmd.colorscheme "catppuccin"

