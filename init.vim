let mapleader = "\<space>"
set termguicolors
lua require('plugins')
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
" 当打开nvim时，若没有下载vim-plug则自动下载
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
if executable('macism')
    autocmd InsertLeave * :call system("macism com.apple.keylayout.ABC")
    autocmd CmdlineLeave * :call system("macism com.apple.keylayout.ABC") 
endif

" ----- settings ----
if exists('g:vscode')
    nnoremap <silent> <C-j> :call vscodenotify('workbench.action.navigatedown')<cr>
    nnoremap <silent> <c-k> :call vscodenotify('workbench.action.navigateup')<cr>
    nnoremap <silent> <c-h> :call vscodenotify('workbench.action.navigateleft')<cr>
    nnoremap <silent> <c-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

    " ----- Plug -----
    call plug#begin('~/.config/nvim/autoload/')
        " 快速跳转
        Plug 'asvetliakov/vim-easymotion'
        " 包裹修改
    call plug#end()
    " sandwich configuration
    highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
    highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
    highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
    highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none
	" 切换行注释	
    " quick scope configuration
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    " vscode keyshort 
	nnoremap gc <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
	" 切换块注释
	nnoremap gC <Cmd>call VSCodeNotify('editor.action.blockComment')<CR>
	" 展开所有折叠
	nnoremap zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
	" 关闭所有折叠
	nnoremap zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
	" 展开当下折叠
	nnoremap zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
	" 关闭当下折叠
	nnoremap zc <Cmd>call VSCodeNotify('editor.fold')<CR>
	" 切换当下折叠
	nnoremap zz <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
	" 转到文件中上一个问题
	nnoremap g[ <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
	" 转到文件中下一个问题
	nnoremap g] <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
    " 用H替换掉^
    noremap H ^
    " 用L替换掉$
    noremap L $
    " 使用vscode的undo替换nvim的undo
	nnoremap u <Cmd>call VSCodeNotify('undo')<CR>
    " easymotion相关配置
    let g:EasyMotion_smartcase = 0
    " easymotion前缀 leader leader
    map <Leader> <Plug>(easymotion-prefix)
    " 其他键位绑定
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)

else
    " 以正常模式启动nvim时加载的配置项
    " 显示行号
    " ----- Plug -----
    call plug#begin('~/.config/nvim/autoload/')
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        "....
        Plug 'lervag/vimtex'
        let g:tex_flavor='latex'
        " 阅读器相关的配置 包含正反向查找功能 仅供参考
        let g:vimtex_view_general_viewer = 'SumatraPDF'
        " let g:vimtex_view_general_options_latexmk = '-reuse-instance'
        let g:vimtex_view_general_options
                    \ = '-reuse-instance -forward-search @tex @line @pdf'
                    \ . ' -inverse-search "' . exepath(v:progpath)
                    \ . ' --servername ' . v:servername
                    \ . ' --remote-send \"^<C-\^>^<C-n^>'
                    \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
                    \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
                    \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'

        " set conceallevel=1
        let g:tex_conceal='abdmg'
        "...
    call plug#end()
	" 切换行注释	
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    " easymotion前缀 leader leader
    map <Leader> <Plug>(easymotion-prefix)
    " 其他键位绑定
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    nnoremap <Leader><Leader> f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
    nnoremap <Leader><Leader> f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
endif
