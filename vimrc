" General Settings
set number
set relativenumber
set nocompatible
set cursorline
set showcmd
set ic
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set incsearch
set hlsearch
set encoding=UTF-8
set mouse=a

" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ryanoasis/vim-devicons'
Plug 'simeji/winresizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'tibabit/vim-templates'

call plug#end()

" CoC extensions
let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-css', 'coc-cssmodules', 'coc-diagnostic', 'coc-docker', 'coc-emmet', 'coc-eslint', 'coc-explorer', 'coc-fzf-preview', 'coc-git', 'coc-highlight', 'coc-html', 'coc-htmlhint', 'coc-html-css-support', 'coc-json', 'coc-lightbulb', 'coc-markdownlint', 'coc-prettier', 'coc-pyright', 'coc-sh', 'coc-stylelintplus', 'coc-snippets', 'coc-spell-checker', 'coc-sql', 'coc-svg', 'coc-tailwindcss', 'coc-texlab', 'coc-tsserver', 'coc-webview', 'coc-xml', 'coc-yaml', 'coc-vimlsp']

" Colorscheme
colorscheme onehalfdark
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight LineNr ctermbg=NONE

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'ayu_dark'
let g:airline_powerline_fonts = 1

" NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" vimtex
let g:vimtex_view_general_viewer = 'zathura'
autocmd BufEnter *.tex set conceallevel=1
autocmd BufEnter *.tex set concealcursor=

" Coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" vim-templates
let g:tmpl_author_name = 'Guillaume Sailé'
