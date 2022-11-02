-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
--
-- -- vim.cmd [[packadd packer.nvim]]-- Lua initialization file

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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
--   augroup end
-- ]])
require("core.options")
local vscode = (vim.fn.exists("g:vscode") == 1)
if vscode == false then
	require("Comment").setup()
	require("bufferline").setup({})
	-- require("plugins.coc")
	-- vim.cmd([[colorscheme zenbones]])
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwin = 1
	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true
	vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>", { desc = "NvimTreeToggle" })
	require("plugins.dashboard")
	-- require("monokai").setup()
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
	-- require("plugins.cinnamon")
end
local status, packer = pcall(require, "packer")
if not status then
	return
end
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Simple plugins can be specified as strings

	-- Lazy loading:
	-- Load on specific commands
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

	-- Load on an autocommand event
	use({ "andymass/vim-matchup", event = "VimEnter" })

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	use({
		"w0rp/ale",
		ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
		cmd = "ALEEnable",
		config = "vim.cmd[[ALEEnable]]",
	})

	-- ins can also depend on rocks from luarocks.org:

	-- Local plugins can be included
	-- use '~/projects/personal/hover.nvim'

	-- ins can have post-install/update hooks
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })

	-- Post-install/update hook with call of vimscript function with argument
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Use specific branch, dependency and run lua file after load

	-- Use dependency and run lua function after load

	-- You can specify multiple plugins in a single call
	use({ "tjdevries/colorbuddy.vim" })
	use({ "sharkdp/fd" })
	-- You can alias plugin names
	use({ "dracula/vim", as = "dracula" })
	use({ "wellle/targets.vim" })
	use({ "preservim/tagbar" })
	use({
		"glepnir/dashboard-nvim",
		disable = vscode,
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
		disable = vscode,
	})
	-- use { "nvim-telescope/telescope-file-browser.nvim" }
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", disable = vscode })
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		disable = vscode,
	})

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
		"nvim-lualine/lualine.nvim",
		disable = vscode,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		-- 'bluz71/vim-nightfly-guicolors',
		"tanvirtin/monokai.nvim",
		disable = vscode,
	})
	use({
		"vim-scripts/ReplaceWithRegister",
	})
	use({
		"numToStr/Comment.nvim",
		disable = vscode,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		disable = vscode,
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use({ "nvim-tree/nvim-web-devicons", disable = vscode })
	use({
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"circlestarzero/nvim-cmp",
		-- "SirVer/ultisnips",
		"circlestarzero/my-snippet",
		"quangnguyen30192/cmp-nvim-ultisnips",
		disable = vscode,
	})
	use({
		"SirVer/ultisnips",
		requires = { { "honza/vim-snippets", rtp = "." } },
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
			vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
			vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
			vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
			vim.g.UltiSnipsRemoveSelectModeMappings = 0
		end,
	})

	use({ "nvim-lua/plenary.nvim" }) -- lua functions that many plugins use

	use({ "christoomey/vim-tmux-navigator", disable = vscode }) -- tmux & split window navigation

	use({ "szw/vim-maximizer", disable = vscode }) -- maximizes and restores current window

	-- snippets
	use({ "L3MON4D3/LuaSnip", "honza/vim-snippets", disable = vscode }) -- snippet engine
	use({ "saadparwaiz1/cmp_luasnip", disable = vscode }) -- for autocompletion
	use({ "rafamadriz/friendly-snippets", disable = vscode }) -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use({ "williamboman/mason.nvim", disable = vscode }) -- in charge of managing lsp servers, linters & formatters
	use({ "williamboman/mason-lspconfig.nvim", disable = vscode }) -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use({ "glepnir/lspsaga.nvim", branch = "main", disable = vscode })
	use({ "jose-elias-alvarez/typescript.nvim", disable = vscode }) -- additional functionality for typescript server (e.g. rename file & update imports)
	use({ "onsails/lspkind.nvim", disable = vscode }) -- vs-code like icons for autocompletion

	-- formatting & linting
	use({ "jose-elias-alvarez/null-ls.nvim", disable = vscode }) -- configure formatters & linters
	use({ "jayp0521/mason-null-ls.nvim", disable = vscode }) -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		disable = vscode,
	})

	-- auto closing
	use({ "windwp/nvim-autopairs" }) -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", disable = vscode }) -- autoclose tags

	-- git integration
	use({ "lewis6991/gitsigns.nvim", disable = vscode }) -- show line modifications on left hand side

	use({ "circlestarzero/vim-easymotionvim", disable = vscode, cond = (vscode == false) })

	use("unblevable/quick-scope")
	use({
		"simrat39/symbols-outline.nvim",
		disable = vscode,
	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- mocha, macchiato, frappe, latte
			})
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	})
	use({
		"godlygeek/tabular",
		"elzr/vim-json",
		"preservim/vim-markdown",
		disable = vscode,
	})
	use({
		"amarakon/nvim-cmp-lua-latex-symbols",
		"ray-x/cmp-treesitter",
		"hrsh7th/cmp-emoji",
		"KadoBOT/cmp-plugins",
		-- use("lervag/vimtex"),
		disable = vscode,
	})
	use({
		-- "quangnguyen30192/cmp-nvim-ultisnips",
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup()
		end,
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons", disable = vscode })
	-- use({ "neoclide/coc.nvim", branch = "release", disable = vscode })
	-- use("quangnguyen30192/cmp-nvim-ultisnips")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
