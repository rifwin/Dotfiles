-- this keymap should be here
-- otherwise lazy.nvim will complain
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim config
require("lazy").setup({
	spec = {
		{ import = "plugin" },
	},
	checker = {
		enabled = true,
	},
})

-- init editor profile
require("profile")

-- init editor keymap
require("keymap")
