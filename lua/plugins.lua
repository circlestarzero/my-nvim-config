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
local notVscode = vscode == false
local packer_bootstrap = ensure_packer() -- true if packer was just installed
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"
-- local notVscode = (vim.fn.exists("g:vscode") == 1) == false
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
	use({ "andymass/vim-matchup", event = "VimEnter" , after = 'nvim-treesitter'})
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
    use {'SirVer/ultisnips',
        requires = {{'honza/vim-snippets', rtp = '.'}},
        config = function()      
            vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
            vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
            vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
            vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
        end
    }
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

	-- use({ "circlestarzero/vim-easymotionvim", cond = notVscode })
	use({ "asvetliakov/vim-easymotion", cond = vscode })

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
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "kkharji/sqlite.lua" },
	})
	use({
		"nvim-telescope/telescope-project.nvim",
		config = function()
			require("telescope").load_extension("project")
		end,
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
    use({
        "junegunn/vim-easy-align",
    })
    use({
        "RRethy/vim-illuminate",
    })
    use({
        'nvim-treesitter/nvim-treesitter-textobjects',
        'p00f/nvim-ts-rainbow',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'mfussenegger/nvim-treehopper',
        after = "nvim-treesitter",
    })
    use { 'rainbowhxch/accelerated-jk.nvim' }
    use{"hrsh7th/vim-eft", opt = true,event = "BufReadPost" }
    use({"romainl/vim-cool",opt = true,event = { "CursorMoved", "InsertEnter" },})
    use { 'karb94/neoscroll.nvim' ,
        config = function()
            require('neoscroll').setup()
        end,
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use({
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require'colorizer'.setup()
        end,
    })
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
                sections = {lualine_c = {require('auto-session-library').current_session_name}},
            }
        end
    }
    use({
        'edluffy/specs.nvim',
        config = function ()
            require('specs').setup{
                show_jumps = true,
                min_jump = 10,
                popup = {
                    delay_ms = 0, -- delay before popup displays
                    inc_ms = 10, -- time increments used for fade/resize effects
                    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
                    width = 10,
                    winhl = "PMenu",
                    fader = require("specs").pulse_fader,
                    resizer = require("specs").shrink_resizer,
                },
                ignore_filetypes = {},
                ignore_buftypes = { nofile = true },
            }
        end,
    })
    -- Lua
    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>', -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    {open = "'", close = "'"},
                    {open = '"', close = '"'},
                    {open = '`', close = '`'},
                    {open = '(', close = ')'},
                    {open = '[', close = ']'},
                    {open = '{', close = '}'}
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = {'nvim-treesitter'}, -- or require if not used so far
        after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    }
    if packer_bootstrap then
        require("packer").sync()
    end
end)
