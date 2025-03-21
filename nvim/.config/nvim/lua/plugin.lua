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

  -- formatter & linter plugin
  {
    name = "mason",
    "williamboman/mason.nvim",
  },
  {
    name = "mason-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  {
    name = "nvim-lspconfig",
    "neovim/nvim-lspconfig",
  },

  -- auto completion plugin
  {
    name = "nvim-cmp",
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
    },
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
