lua require('myinit')
PackerCompile<CR>
" augroup packer_user_config
"   autocmd!
"   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
" augroup end
" if mpty(glob('~/.config/nvim/autoload/plug.vim'))
"     silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" if exists('g:vscode')
    
" endif
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
