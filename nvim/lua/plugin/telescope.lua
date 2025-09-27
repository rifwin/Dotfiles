-- telescope fuzzy finder
return {
  "nvim-telescope/telescope.nvim",
  name = "telescope",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require('telescope').setup({})
  end
}
