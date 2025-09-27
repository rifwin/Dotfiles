-- treesitter syntax highlight
return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ensure_installed = {
        "c",
        "cpp",
        "javascript",
        "typescript",
        "python",
        "lua",
        "bash",
        "cmake",
        "zig"
      },
    })
  end
}
