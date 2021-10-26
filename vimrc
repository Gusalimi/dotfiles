" General Settings
set number
set nocompatible
set cursorline
set showcmd
set ic
set smartcase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber
set incsearch
set hlsearch
set encoding=UTF-8

call plug#begin('~/.vim/plugged')

Plug 'kaicataldo/material.vim', {'branch': 'main'}
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" Material Theme
colorscheme material
"if (has('termguicolors'))
"  set termguicolors
"endif
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Coc.nvim
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'material'
let g:airline_powerline_fonts = 1
