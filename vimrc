" General Settings
filetype plugin on
set number
set relativenumber
set nocompatible
set nofoldenable
set cursorline
set showcmd
set ic
set autoindent
set smartcase
set tabstop=4
set shiftwidth=4
set noexpandtab
set incsearch
set hlsearch
set encoding=UTF-8
set mouse=a
set exrc
set secure
set foldmethod=syntax
let mapleader=","

" C/42 specific
runtime! ftplugin/man.vim
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Install vim-plug:
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins:
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ryanoasis/vim-devicons'
Plug 'simeji/winresizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug '42Paris/42header'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'dstein64/vim-win'
Plug 'mg979/vim-localhistory'
Plug 'tpope/vim-eunuch'
Plug 'Lenovsky/nuake'
Plug 'dhruvasagar/vim-zoom'
Plug 'enricobacis/vim-airline-clock'

call plug#end()

" Colorscheme:
set t_Co=256
colorscheme catppuccin
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight LineNr ctermbg=NONE


" Airline:
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'catpuccin'
let g:airline_powerline_fonts = 1
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000

" NERDTree:
nnoremap <leader>n :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeGitStatusUseNerdFonts = 1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Vimtex:
let g:vimtex_view_general_viewer = 'zathura'
autocmd BufEnter *.tex set conceallevel=1
autocmd BufEnter *.tex set concealcursor=

" SnipMate:
let g:snipMate = { 'snippet_version' : 1 }

" LocalHistory:
let g:lh_autobackup_first = 1
let g:lh_autobackup_size  = 51200

" Terminal:
nnoremap <leader>t :Nuake<CR>
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
