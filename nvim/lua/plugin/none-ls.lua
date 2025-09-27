-- extend formatter and linter
return {
  "nvimtools/none-ls.nvim",
  name = "none-ls",
  config = function()
    require("null-ls").setup({})
  end
}
