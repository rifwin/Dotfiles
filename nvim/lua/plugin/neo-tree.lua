-- file explorer / file tree
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neo-tree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    -- already lazy by default
    lazy = false,

    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
          }
        }
      })
    end
  }
}
