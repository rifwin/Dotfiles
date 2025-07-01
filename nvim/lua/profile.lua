local treeSitter = require("nvim-treesitter.configs")
local mason = require("mason")
local masonLspConfig = require("mason-lspconfig")
local miniPairs = require("mini.pairs")
local cmakeTools = require("cmake-tools")
local telescope = require("telescope")
local neoTree = require("neo-tree")
local lualine = require("lualine")
local rosepineTheme = require("rose-pine")
local blinkcmp = require("blink.cmp")
local luasnip = require("luasnip")


-- setup tree-sitter code highlight
treeSitter.setup({
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

-- mason lsp package manager
-- write any necessary lsp that need to be installed here
-- let mason handle it
-- doesnt need to manual install using os level package manager
mason.setup()
masonLspConfig.setup({
  automatic_enable = true,
  ensure_installed = {
    "lua_ls",
    "ruff",
    "basedpyright",
    "clangd",
    "zls",
    "biome",
    "bashls",
    "cmake",
    "jsonls"
  }
})

-- snippets from luasnip
luasnip.setup({})

-- auto completion
blinkcmp.setup({
  keymap = {
    preset = 'default',
    ["<C-k>"] = { "select_next" },
    ["<C-j>"] = { "select_prev" },
    ["<C-CR>"] = { "accept" },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    }
  },
  sources = {
    default = {
      'lsp',
      'path',
      'snippets',
      'buffer',
      'omni'
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = {
    enabled = true
  }
})

-- LSP configuration after Nvim 0.11+
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
vim.lsp.config("basedpyright", {})

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
rosepineTheme.setup({ styles = { transparency = true } })
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

-- lualine setup
lualine.setup({
  options = {
    theme = "rose-pine"
  }
})
