-- neovim lsp config
-- also coq.nvim (code completion & linter) should be installed here
return {
  "neovim/nvim-lspconfig",
  name = "nvim-lspconfig",
  lazy = false,

  dependencies = {
    -- coq as dependencies
    { "ms-jpq/coq_nvim",       branch = "coq" },
    { "ms-jpq/coq.artifacts",  branch = "artifacts" },
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
  },

  init = function()
    vim.g.coq_settings = {
      -- COQ settings here
      auto_start = "shut-up",
      keymap = {
        recommended = false,
        bigger_preview = "",
        jump_to_mark = ""
      },
    }
  end,
  config = function()
    -- LSP settings here
  end,
}
