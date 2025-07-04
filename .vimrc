if !has('gui_running')
  set t_Co=256
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" THEME --------------------------
set termguicolors
syntax enable
colorscheme catppuccin_mocha
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 2

" UI -----------------------------
set laststatus=2
set number
set relativenumber
set cursorline

" General ------------------------
set nocompatible
set noshowmode
filetype plugin indent on
syntax on
set shiftwidth=4
set tabstop=4
set expandtab
set wrap
set timeoutlen=500
set ttimeoutlen=50
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

" Snippets -----------------------
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Keymaps ------------------------
let mapleader = " "
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>f :FZF<CR>
