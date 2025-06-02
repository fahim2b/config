if !has('gui_running')
  set t_Co=256
endif

" PLUGINS ----------------------------------------------------------------
call plug#begin('~/.vim/plugged')
 " Auto Pairs
  Plug 'jiangmiao/auto-pairs'

  " Linting & File Navigation
  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'
  
  " UI Enhancements
  Plug 'itchyny/lightline.vim'
  "Plugin 'vim-airline/vim-airline-themes'

  Plug 'catppuccin/vim', { 'as': 'catppuccin' } 
  let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
  
  " Search & Navigation
  Plug 'junegunn/fzf' " Fuzzy finder
  Plug 'tpope/vim-fugitive' " Git integration

  " Snippets
  Plug 'SirVer/ultisnips' " Snippet engine
  Plug 'honza/vim-snippets' " Predefined snippets

call plug#end()

" THEME ------------------------------------------------------------------
set termguicolors
colorscheme catppuccin_mocha

" STATUS LINE ------------------------------------------------------------
set laststatus=2
set statusline=%F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" GENERAL SETTINGS -------------------------------------------------------
vnoremap <C-c> :w !xsel --clipboard --input<CR>
set termguicolors
set nocompatible
set noshowmode
filetype plugin indent on
syntax on
set number
set relativenumber
set rnu
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set wrap
set scrolloff=10
set ignorecase
set smartcase
set showcmd
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" SNIPPET CONFIG ---------------------------------------------------------
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Custom Keybindings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-f> :FZF<CR>
