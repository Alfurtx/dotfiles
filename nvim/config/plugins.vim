" ### PLUGINS ###

call plug#begin('~/.config/nvim/plugged')

" code formatting LINUX KERNEL STYLE (for C, obviously)
Plug 'vivien/vim-linux-coding-style'

" documentation generation with Doxygen style
Plug 'vim-scripts/DoxygenToolkit.vim'

" fuzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" fancy starting screen for nvim
Plug 'mhinz/vim-startify'

" buffer view
Plug 'bling/vim-bufferline'

" emmet
Plug 'mattn/emmet-vim'

" keybinding helper
" Plug 'liuchengxu/vim-which-key'

" other plugins (TODO: categorize them)
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ############################################################################
