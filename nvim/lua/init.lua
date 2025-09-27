-- lazy.nvim config
require("lazy_init")
require("setting")
require("keymap")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
