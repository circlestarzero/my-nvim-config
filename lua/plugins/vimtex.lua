vim.g.tex_flavor = "latex"
-- 阅读器相关的配置 包含正反向查找功能 仅供参考
vim.g.vimtex_view_general_viewer = "SumatraPDF"
-- vim.g.vimtex_view_general_options_latexmk = '-reuse-instance'
-- vim.g.vimtex_view_general_options
--             \ = '-reuse-instance -forward-search @tex @line @pdf'
--             \ . ' -inverse-search "' . exepath(v:progpath)
--             \ . ' --servername ' . v:servername
--             \ . ' --remote-send \"^<C-\^>^<C-n^>'
-- \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
-- \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
-- \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'

-- set conceallevel=1
vim.g.tex_conceal = "abdmg"
