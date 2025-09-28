local telescope = require("telescope.builtin")

-- fix for auto pair curly braces doesnt work on xterm
vim.api.nvim_set_keymap('i', '<S-{>', '{', { noremap = false })


-- lazy.nvim keymap
vim.api.nvim_set_keymap("n", "<leader>lz", ":Lazy<CR>", {})


-- navigation remap jump up/down
vim.keymap.set("n", "j", "<Up>", { noremap = true })
vim.keymap.set("n", "k", "<Down>", { noremap = true })

vim.keymap.set("v", "j", "<Up>", { noremap = true })
vim.keymap.set("v", "k", "<Down>", { noremap = true })


-- jump to next/before space
vim.keymap.set("n", "<C-l>", "<C-Right>", {})
vim.keymap.set("n", "<C-h>", "<C-Left>", {})
vim.keymap.set("v", "<C-l>", "<C-Right>", {})
vim.keymap.set("v", "<C-h>", "<C-Left>", {})


-- move left/right when on insert mode
vim.keymap.set("i", "<C-S-l>", "<Right>", {})
vim.keymap.set("i", "<C-S-h>", "<Left>", {})


-- telescope kemap ( quick find file )
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


-- clear search highlight
vim.keymap.set("n", "<C-/>", function()
  vim.v.hlsearch = false
end, {})


-- coq autocompletion keymap
-- close completion menu
vim.keymap.set('i', '<Esc>', function()
  if vim.fn.pumvisible() then
    return "<C-e><Esc>"
  else
    return "<Esc>"
  end
end, { expr = true, silent = true })

vim.keymap.set('i', '<BS>', function()
  if vim.fn.pumvisible() then
    return "<C-e><BS>"
  else
    return "<BS>"
  end
end, { expr = true, silent = true })

-- accept
vim.keymap.set("i", "<C-CR>", function()
  if vim.fn.pumvisible() then
    if vim.fn.complete_info().selected == -1 then
      return "<C-r><CR>"
    else
      return "<C-y>"
    end
  else
    return "<C-CR>"
  end
end, { expr = true, silent = true })

-- navigation
vim.keymap.set('i', '<C-k>', function()
  if vim.fn.pumvisible() then
    return ("<C-n>")
  else
    return ("<C-k>")
  end
end, { expr = true, silent = true })

vim.keymap.set('i', '<C-j>', function()
  if vim.fn.pumvisible() then
    return ("<C-p>")
  else
    return ("<C-j>")
  end
end, { expr = true, silent = true })
