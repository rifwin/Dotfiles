-- mini.nvim utility plugin
return {
  'echasnovski/mini.nvim',
  name = "mini-nvim",
  version = '*',

  config = function()
    require("mini.pairs").setup({
      mappings = {
        ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
        ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
      }
    })
  end
}
