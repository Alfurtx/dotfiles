let g:coc_global_extensions = [ 'coc-prettier', 
    \ 'coc-pairs',
    \ 'coc-html-css-support',
    \ 'coc-vimlsp',
    \ 'coc-html', 
    \ 'coc-snippets', 
    \ 'coc-highlight', 
    \ 'coc-eslint', 
    \ 'coc-diagnostic', 
    \ 'coc-emmet', 
    \ 'coc-calc', 
    \ 'coc-cmake', 
    \ 'coc-git', 
    \ 'coc-yaml', 
    \ 'coc-tsserver', 
    \ 'coc-sumneko-lua', 
    \ 'coc-sh', 
    \ 'coc-pyright', 
    \ 'coc-lua', 
    \ 'coc-json', 
    \ 'coc-java', 
    \ 'coc-css', 
    \ 'coc-clangd'
    \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
