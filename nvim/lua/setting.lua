-- lua
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

-- python
vim.lsp.config("ruff", {})
vim.lsp.config("pylyzer", {})

-- bash
vim.lsp.config("bashls", {})

-- javascript/typescript
vim.lsp.config("biome", {
  cmd = {
    "biome",
    "lsp-proxy"
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json"
  },
  root_markers = { "biome.json", ".biome.json", "package.json", ".git" },
  single_file_support = true
})

-- c/cpp
vim.lsp.config("clangd", {})

-- zig
vim.lsp.config("zls", {})


-- set editor theme
vim.cmd('colorscheme rose-pine-moon')

-- yank to system clipboard
vim.opt.clipboard = "unnamedplus"

-- turn on line numbering
vim.wo.number = true

-- 2 space tab setting
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2

-- show max text width indicator
vim.cmd("set colorcolumn=80")
