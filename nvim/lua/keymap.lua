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


-- Coq Autocompletion Keymaps
-- Close completion menu (Standard)
vim.keymap.set('i', '<Esc>', function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-e><Esc>"
  else
    return "<Esc>"
  end
end, { expr = true, silent = true, desc = 'Coq: Close menu (Esc)' })

vim.keymap.set('i', '<C-c>', function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-e><C-c>"
  else
    return "<C-c>"
  end
end, { expr = true, silent = true, desc = 'Coq: Close menu (C-c)' })

vim.keymap.set('i', '<BS>', function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-e><BS>"
  else
    return "<BS>"
  end
end, { expr = true, silent = true, desc = 'Coq: Close menu and backspace' })

-- ACCEPT COMPLETION: NOW ON <C-CR> (Ctrl+Enter)

vim.keymap.set("i", "<C-CR>", function()
  if vim.fn.pumvisible() ~= 0 then
    -- If no item is selected, close menu and press C-CR
    if vim.fn.complete_info().selected == -1 then
      return "<C-e><C-CR>"
      -- Otherwise, accept the selected completion with <C-y>
    else
      return "<C-y>"
    end
  else
    return "<C-CR>"
  end
end, { expr = true, silent = true, desc = 'Coq: Accept completion (C-CR)' })

-- NAVIGATION (C-k and C-j)
-- C-j: Navigate UP
vim.keymap.set('i', '<C-j>', function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-p>"
  else
    return "<C-j>"
  end
end, { expr = true, silent = true, desc = 'Coq: Previous item (C-j)' })

-- C-k: Navigate DOWN
vim.keymap.set('i', '<C-k>', function()
  if vim.fn.pumvisible() ~= 0 then
    return "<C-n>" -- Next completion item
  else
    return "<C-k>" -- Normal C-j command
  end
end, { expr = true, silent = true, desc = 'Coq: Next item (C-k)' })
