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
-- local notVscode = (vim.fn.exists("g:vscode") == 1) == false
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
	use({ "andymass/vim-matchup", event = "VimEnter" })
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })
	-- use({
	-- 	"glacambre/firenvim",
	-- 	run = function()
	-- 		vim.fn["firenvim#install"](0)
	-- 	end,
	-- })
	-- use({ "tjdevries/colorbuddy.vim" })
	use({ "sharkdp/fd" })
	-- You can alias plugin names
	use({ "wellle/targets.vim" })
	-- use({ "preservim/tagbar" })
	use({
		"glepnir/dashboard-nvim",
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- use { "nvim-telescope/telescope-file-browser.nvim"
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope-file-browser.nvim",
	})
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})
	use({
		"nvim-lualine/lualine.nvim",

		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		-- 'bluz71/vim-nightfly-guicolors',
		"tanvirtin/monokai.nvim",
	})
	use({
		"vim-scripts/ReplaceWithRegister",
	})
	use({
		"numToStr/Comment.nvim",
	})
	use({
		"nvim-tree/nvim-tree.lua",

		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		-- tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use({ "nvim-tree/nvim-web-devicons" })
	use({
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"circlestarzero/nvim-cmp",
		"circlestarzero/my-snippet",
		"quangnguyen30192/cmp-nvim-ultisnips",
	})
	use({
		"SirVer/ultisnips",
		requires = { { "honza/vim-snippets", rtp = "." } },
	})

	use({ "nvim-lua/plenary.nvim" }) -- lua functions that many plugins use

	use({ "christoomey/vim-tmux-navigator" }) -- tmux & split window navigation

	use({ "szw/vim-maximizer" }) -- maximizes and restores current window

	-- snippets
	use({ "L3MON4D3/LuaSnip", "honza/vim-snippets" }) -- snippet engine
	use({ "saadparwaiz1/cmp_luasnip" }) -- for autocompletion
	use({ "rafamadriz/friendly-snippets" }) -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use({ "williamboman/mason.nvim" }) -- in charge of managing lsp servers, linters & formatters
	use({ "williamboman/mason-lspconfig.nvim" }) -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use({ "jose-elias-alvarez/typescript.nvim" }) -- additional functionality for typescript server (e.g. rename file & update imports)
	use({ "onsails/lspkind.nvim" }) -- vs-code like icons for autocompletion

	-- formatting & linting
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- configure formatters & linters
	use({ "jayp0521/mason-null-ls.nvim" }) -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use({ "windwp/nvim-autopairs" }) -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use({ "lewis6991/gitsigns.nvim" }) -- show line modifications on left hand side

	use({ "circlestarzero/vim-easymotionvim", disable = vscode })

	use("unblevable/quick-scope")
	use({
		"simrat39/symbols-outline.nvim",
	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use({
		"godlygeek/tabular",
		"elzr/vim-json",
		"preservim/vim-markdown",
	})
	use({
		"amarakon/nvim-cmp-lua-latex-symbols",
		"ray-x/cmp-treesitter",
		"hrsh7th/cmp-emoji",
		"KadoBOT/cmp-plugins",
		-- use("lervag/vimtex"),
	})
	use({
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup()
		end,
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })
	-- use({ "neoclide/coc.nvim", branch = "release", })
	-- use("quangnguyen30192/cmp-nvim-ultisnips")
	use({
		"lervag/vimtex",
	})
	-- use({ "asvetliakov/vim-easymotion", disable = notVscode })
	if packer_bootstrap then
		require("packer").sync()
	end
end)
