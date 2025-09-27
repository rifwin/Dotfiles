-- lualine cosmetics plugin
return {
  "nvim-lualine/lualine.nvim",
  name = "nvim-lualine",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("lualine").setup({
      options = {
        theme = "rose-pine"
      }
    })
  end
}
