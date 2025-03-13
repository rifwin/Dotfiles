local telescope = require("telescope.builtin")
local cmp = require("cmp")

-- fix for auto pair curly braces doesnt work on xterm
vim.api.nvim_set_keymap('i', '<S-{>', '{', { noremap = false })

-- lazy keymap
vim.api.nvim_set_keymap("n", "<leader>lz", ":Lazy<CR>", {})

-- navigation remap k&j
vim.keymap.set("n", "j", "<Up>", { noremap = true })
vim.keymap.set("n", "k", "<Down>", { noremap = true })

vim.keymap.set("v", "j", "<Up>", { noremap = true })
vim.keymap.set("v", "k", "<Down>", { noremap = true })

-- jump space letf/right when on normal mode
vim.keymap.set("n", "<C-l>", "<C-Right>", {})
vim.keymap.set("n", "<C-h>", "<C-Left>", {})

-- move left/right when on insert mode
vim.keymap.set("i", "<C-S-l>", "<Right>", {})
vim.keymap.set("i", "<C-S-h>", "<Left>", {})

-- cmp auto complete keymap
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Enter>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    ["<C-j>"] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Insert
    }),
    ["<C-k>"] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert
    }),
    ["<C-e>"] = cmp.mapping.abort(),
  })
})

-- telescope keymap ( quick find file )
vim.keymap.set("n", "<C-S-p>", telescope.find_files, {})
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})

-- neotree keymap ( sidebar file tree )
vim.keymap.set("n", "<C-S-e>", ":Neotree toggle<CR>", {})
vim.keymap.set("n", "<leader>fe", ":Neotree toggle<CR>", {})

-- open lsp hover info
vim.keymap.set("n", "<S-k>", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>kk", vim.lsp.buf.hover, {})

-- lsp go to definition
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})

-- lsp code action menu
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- lsp format document
vim.keymap.set("n", "<C-S-f>", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, {})

-- open floating terminal
vim.keymap.set(
  "n",
  "<C-S-Enter>",
  ":FloatermNew --width=0.8 --height=0.8 <CR>",
  {}
)
