local keymap = vim.keymap
vim.g.mapleader = " "
keymap.set("n", "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>")
keymap.set("n", "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>")
keymap.set("n", "<C-h>", "<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>")
keymap.set("n", "<C-l>", "<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>")
keymap.set("n", "gc", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
keymap.set("n", "gC", "<Cmd>call VSCodeNotify('editor.action.blockComment')<CR>")
keymap.set("n", "zR", "<Cmd>call VSCodeNotify('editor.unfoldAll')<CR>")
keymap.set("n", "zM", "<Cmd>call VSCodeNotify('editor.foldAll')<CR>")
keymap.set("n", "zo", "<Cmd>call VSCodeNotify('editor.unfold')<CR>")
keymap.set("n", "zc", "<Cmd>call VSCodeNotify('editor.fold')<CR>")
keymap.set("n", "zz", "<Cmd>call VSCodeNotify('editor.toggleFold')<CR>")
keymap.set("n", "g[", "<Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>")
keymap.set("n", "g]", "<Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>")
keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("", "<Leader>b", "<Plug>(easymotion-b)", { noremap = false, silent = true })
keymap.set("", "<Leader>w", "<Plug>(easymotion-w)", { noremap = false, silent = true })
keymap.set("", "<Leader>l", "<Plug>(easymotion-lineforward)", { noremap = false, silent = true })
keymap.set("", "<Leader>j", "<Plug>(easymotion-j)", { noremap = false, silent = true })
keymap.set("", "<Leader>k", "<Plug>(easymotion-k)", { noremap = false, silent = true })
keymap.set("", "<Leader>h", "<Plug>(easymotion-linebackward)", { noremap = false, silent = true })
vim.cmd([[
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
]])
