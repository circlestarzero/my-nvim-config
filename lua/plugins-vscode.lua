local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local vscode = (vim.fn.exists("g:vscode") == 1)
local packer_bootstrap = ensure_packer() -- true if packer was just installed
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
	use({ "andymass/vim-matchup", event = "VimEnter" })
	use({ "asvetliakov/vim-easymotion", cond = vscode })
	use({ "sharkdp/fd" })
	use({ "wellle/targets.vim" })
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({
		"vim-scripts/ReplaceWithRegister",
	})
	use( "nvim-lua/plenary.nvim" ) -- lua functions that many plugins use
	use("unblevable/quick-scope")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
