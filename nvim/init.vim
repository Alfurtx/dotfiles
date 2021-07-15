" ### NEW INIT.VIM ###

source $XDG_CONFIG_HOME/nvim/config/fzf.vim
let g:nvim_vim_config_modules = '$XDG_CONFIG_HOME/nvim/config'
let g:nvim_lua_config_modules = '$XDG_CONFIG_HOME/nvim/lua'
" let g:lua_config_files_list = [
"             \ 'lsp-install.lua'
"             \ ]
let g:vim_config_file_list = [
            \ 'keybindings.vim',
            \ 'fzf.vim',
            \ 'coc.vim',
            \ 'airline.vim',
            \ 'plugins.vim',
            \ 'settings.vim',
            \ 'treesitter.vim',
            \ ]

for f in vim_config_file_list
    execute 'source' . g:nvim_vim_config_modules . '/' . f
endfor

" ### COLOR SCHEME ###

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italix = '1'
let g:gruvbox_bold = '1'
colorscheme gruvbox
"
"" ############################################################################
