" ### KEYBINDINGS ###

let mapleader = " "

nnoremap <leader><Tab> :bn<CR>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<CR>"

" ############################################################################
