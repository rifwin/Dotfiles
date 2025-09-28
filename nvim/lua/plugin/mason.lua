-- mason lsp package manager
-- write any necessary lsp that need to be installed here
-- let mason handle it
-- doesnt need to manual install using os level package manager
return {
  {
    "mason-org/mason.nvim",
    name = "mason",

    config = function()
      require("mason").setup({})
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    name = "mason-lspconfig",

    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
          "lua_ls",
          "ruff",
          "ty",
          "clangd",
          "zls",
          "biome",
          "bashls",
          "cmake",
          "jsonls",
          "hyprls"
        }
      })
    end
  }
}
