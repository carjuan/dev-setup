filetype on                 
filetype plugin on
syntax on
set nocompatible
set noshowmode
set noerrorbells
set number
set encoding=utf-8
set laststatus=2 
set ruler
set nowrap
set smartcase
set noswapfile
set incsearch
set tabstop=2
set mouse =a
set clipboard=unnamed
set showcmd
set showmatch
set sw=2
set number relativenumber
set wildmenu
set hls
set smartindent
set smarttab
set nobackup
set nowritebackup
set colorcolumn=80
set scrolloff=10
set showcmd
set ignorecase
set smartcase
set confirm 
set cmdheight=3
set statusline+=%{FugitiveStatusline()}



" Plugins =============================================
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" For vim-plug users, the following line must be added
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Vim plugin manager

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'chrisbra/colorizer'
" Easy Motion for vim
Plug 'easymotion/vim-easymotion' 
"File Manager for Vim
Plug 'preservim/nerdtree'

"Switch between vim panes easly, including NERDTree
Plug 'christoomey/vim-tmux-navigator'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'

Plug 'honza/vim-snippets'

Plug 'jiangmiao/auto-pairs'

Plug 'heavenshell/vim-jsdoc'
" ...
" All of your Plugins must be added before the following line
call plug#end()
" setting up path to load fzf from the brew installation
set rtp+=~/usr/local/opt/fzf
" Using vim-plug as the vim plugin manager
" command config for fzf preview mode to work 
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" JsDoc - lehre dependency path
let g:jsdoc_lehre_path = '/usr/local/lib/node_modules/lehre/bin/lehre'


" NERDCOMMENTER" ==============================================

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

let NERDTreeQuitOnOpen= 1

"colorscheme configs ===========================================

colorscheme gruvbox 
set background=dark


"Mappings ======================================================

let mapleader=" "


" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <Leader>nh :noh<CR>

nnoremap <leader>nt :NERDTreeFind<CR>
nnoremap <leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>nw :q!<CR>
nnoremap <Leader>r :w<CR>:!node %<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :tabnew $MYVIMRC<CR>
nnoremap <Leader>ip :PlugInstall<CR>
vnoremap <Leader>nn <ESC>

inoremap jj <ESC>

" Easy Motion mapping configs
nnoremap <Leader>s <Plug>(easymotion)

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" fzf keymappings
"
nnoremap <Leader>o :Files<CR>



" in insert mode, navigate through autocompletions using <TAB> 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

