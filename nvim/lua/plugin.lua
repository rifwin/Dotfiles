local plugins = {
  -- fuzzy file finder
  {
    name = "telescope",
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },

  -- file explorer / file tree
  {
    name = "neo-tree",
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim"
    },
  },

  -- treesitter syntax highlight
  {
    name = "treesitter",
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- lsp automatic package installer
  {
    name = "mason",
    "mason-org/mason.nvim",
  },
  {
    name = "mason-lspconfig",
    "mason-org/mason-lspconfig.nvim",
  },
  {
    name = "nvim-lspconfig",
    "neovim/nvim-lspconfig",
  },

  -- extend formatter and linter
  {
    name = "none-ls",
    "nvimtools/none-ls.nvim",
  },

  -- auto completion plugin
  {
    name = "blink-cmp",
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = "*",
  },

  -- mini.nvim utility plugin
  {
    name = "mini-nvim",
    'echasnovski/mini.nvim',
    version = '*'
  },

  -- floating terminal plugin
  {
    'voldikss/vim-floaterm'
  },

  -- cmake plugin
  {
    name = "cmake-tools",
    "Civitasv/cmake-tools.nvim",
  },

  -- lualine cosmetics plugin
  {
    name = "nvim-lualine",
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- editor theme plugin
  {
    name = "rose-pine",
    "rose-pine/neovim",
    lazy = false

  }
}

return plugins
