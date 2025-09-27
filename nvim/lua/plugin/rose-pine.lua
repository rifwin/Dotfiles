return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,

  config = function()
    require("rose-pine").setup({
      styles = { transparency = true }
    })
  end
}
