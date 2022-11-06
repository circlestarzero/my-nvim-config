-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("n", "<leader>tb", ":SymbolsOutline<CR>")
-- keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
-- keymap.del("o", "A")
keymap.set("n", "<Leader>ps", ":PackerSync<CR>") --  go to previous tab
keymap.set("n", "<Leader>bg", ":BufferLinePick<CR>") --  go to previous tab
keymap.set("n", "<Leader>bc", ":BufferLinePickClose<CR>") --  go to previous tab
keymap.set("n", "<Leader>bp", ":BufferLineCyclePrev<CR>") --  go to previous tab
keymap.set("n", "<Leader>bn", ":BufferLineCycleNext<CR>") --  go to previous tab
keymap.set("n", "<Leader>1", ":BufferLineGoToBuffer 1<CR>") --  go to previous tab
keymap.set("n", "<Leader>2", ":BufferLineGoToBuffer 2<CR>") --  go to previous tab
keymap.set("n", "<Leader>3", ":BufferLineGoToBuffer 3<CR>") --  go to previous tab
keymap.set("n", "<Leader>4", ":BufferLineGoToBuffer 4<CR>") --  go to previous tab
keymap.set("n", "<Leader>5", ":BufferLineGoToBuffer 5<CR>") --  go to previous tab
keymap.set("n", "<Leader>6", ":BufferLineGoToBuffer 6<CR>") --  go to previous tab
keymap.set("n", "<Leader>7", ":BufferLineGoToBuffer 7<CR>") --  go to previous tab
keymap.set("n", "<Leader>8", ":BufferLineGoToBuffer 8<CR>") --  go to previous tab
keymap.set("n", "<Leader>9", ":BufferLineGoToBuffer 9<CR>") --  go to previous tab
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("", "<leader>lr", ":LspRestart<CR>") -- mapping to restart lsp if necessary
keymap.set("", "<leader>li", ":LspInfo<CR>") -- mapping to restart lsp if necessary

-- keymap.set("", "<Leader>b", "<Plug>(easymotionvim-b)", { noremap = false, silent = true })
keymap.set("", "<Leader>w", "<cmd>HopWord<cr>")
keymap.set("", "<Leader>j", "<cmd>HopLine<cr>")
keymap.set("", "<Leader>k", "<cmd>HopLine<cr>")
keymap.set("", "<Leader>c", "<cmd>HopChar1<cr>")
keymap.set("", "<Leader>cc", "<cmd>HopChar2<cr>")

keymap.set("", "<Leader>fl", ":NvimTreeToggle<CR>", { desc = "NvimTreeToggle" })
keymap.set("n", "<Leader>fe", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<Leader>fw", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")

keymap.set("n","ga","<Plug>(EasyAlign)")
keymap.set("x","ga","<Plug>(EasyAlign)")

keymap.set("o","m",":<C-U>lua require('tsht').nodes()<CR>")
keymap.set("x","m",":lua require('tsht').nodes()<CR>")
keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', {})
keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', {})

keymap.set('','f','<Plug>(eft-f)')
keymap.set('','F','<Plug>(eft-F)')
keymap.set('','t','<Plug>(eft-t)')
keymap.set('','T','<Plug>(eft-T)')
keymap.set('',';','<Plug>(eft-repeat)')

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
