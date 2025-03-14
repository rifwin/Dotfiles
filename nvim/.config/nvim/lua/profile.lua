local treeSitter = require("nvim-treesitter.configs")
local mason = require("mason")
local masonLspConfig = require("mason-lspconfig")
local nvimLspConfig = require("lspconfig")
local draculaTheme = require("dracula")
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspKind = require("lspkind")
local miniPairs = require("mini.pairs")
local cmakeTools = require("cmake-tools")
local telescope = require("telescope")
local neoTree = require("neo-tree")

-- setup tree-sitter language setting
treeSitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true,
  ensure_installed = {
    "c",
    "cpp",
    "javascript",
    "python",
    "lua",
    "bash",
    "cmake"
  },
})

-- mason lsp package manager
mason.setup()
masonLspConfig.setup({ ensure_installed = { "lua_ls" } })

-- linter & formatter
nvimLspConfig.lua_ls.setup({ capabilities = capabilities })
nvimLspConfig.clangd.setup({ capabilities = capabilities })
nvimLspConfig.zls.setup({ capabilities = capabilities })
nvimLspConfig.eslint.setup({ capabilities = capabilities })
nvimLspConfig.bashls.setup({ capabilities = capabilities })
nvimLspConfig.cmake.setup({ capabilities = capabilities })

-- auto completion plugin
cmp.setup({
  sources = { { name = "nvim_lsp" }, { name = "path" }, { name = "buffer" } },
  formatting = {
    -- put a tiny icon on completion menu
    format = lspKind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
    })
  }
})

-- auto pairs plugin
miniPairs.setup({
  mappings = {
    ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
    ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
  }
})

-- cmake tools
cmakeTools.setup({})

-- telescope fuzzy find
telescope.setup({
  pickers = {
    find_files = {
      hidden = true
    }
  }
})

-- neo tree file explorer
neoTree.setup({
  filesystem = {
    filtered_items = {
      visible = true,
    }
  }
})

-- set editor theme
draculaTheme.setup({ transparent_bg = true })
vim.cmd("colorscheme dracula-soft")

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
