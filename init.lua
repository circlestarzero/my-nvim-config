-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
--
-- -- vim.cmd [[packadd packer.nvim]]-- Lua initialization file

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

vim.cmd([[
if executable('macism')
    autocmd InsertLeave * :call system("macism com.apple.keylayout.ABC")
    autocmd CmdlineLeave * :call system("macism com.apple.keylayout.ABC") 
endif
]])
require("core.options")
local vscode = (vim.fn.exists("g:vscode") == 1)
if vscode == false then
	require("Comment").setup()
	vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
	require("bufferline").setup({})
	-- vim.cmd([[colorscheme zenbones]])
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwin = 1
	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true
	require("plugins.dashboard")
	require("core.keymaps")
	-- require("core.colorscheme")
	require("plugins.comment")
	require("plugins.vim_markdown")
	require("plugins.nvim-tree")
	require("plugins.lualine")
	require("plugins.telescope")
	require("plugins.nvim-cmp")
	require("plugins.lsp.mason")
	require("plugins.lsp.lspsaga")
	require("plugins.lsp.lspconfig")
	require("plugins.lsp.null-ls")
	require("plugins.autopairs")
	require("plugins.treesitter")
	require("plugins.gitsigns")
	require("plugins.out-lines")
	require("plugins.vimtex")
	require("plugins")
	-- require("plugins.cinnamon")
else
	require("core.keymaps-vscode")
	require("plugins-vscode")
end
local status, packer = pcall(require, "packer")
if not status then
	return
end
