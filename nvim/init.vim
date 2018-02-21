
" Vundle Setup
"
set rtp+=$HOME/.config/vundle/bundle/Vundle.vim
call vundle#begin('$HOME/.config/vundle/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'gregsexton/matchtag'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'alvan/vim-closetag'
Plugin 'ryanoasis/vim-devicons'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'trevordmiller/nova-vim'
Plugin 'mattn/emmet-vim'
Plugin 'atelierbram/Base2Tone-vim'

call vundle#end()

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Remove padding after devicon
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Close vim if Nerdtree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set nocompatible
set background=dark
colorscheme base16-atelier-sulphurpool
let g:airline_theme='base16'
set termguicolors

filetype plugin indent on
syntax on

" Plugin Customization
"
set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ale_linters = { 'javascript': ['eslint'], 'scss': ['prettier'], 'python': ['flake8'], 'html': ['tidy'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'scss': ['prettier'], 'python': ['autopep8'], 'html': ['tidy'] }
let g:ale_echo_msg_format = '%s [%linter%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'

let NERDTreeIgnore = [ '\.pyc$', 'cache$', '__pycache__$', 'node_modules$' ]
let g:airline_powerline_fonts = 1

" Setup ALE error highligting highlights; uses base16-sulphurpool bg and fg

execute "highlight ALEErrorSign guifg=#c94922 guibg=#293256"

highlight CursorLineNr guifg=#ac9739

set path+=**
set wildmenu
set encoding=utf-8

" Folding. First two load/save on open/exit
"
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview
set foldlevel=99

set relativenumber
set number
let loaded_matchparen = 1

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set hidden              " Saves undo history when changing buffers
set scrolloff=7         " Sets number of lines above and below cursor
set cmdheight=2         " Increase command-line height; default is 1
set laststatus=2        " Show statusline/airline
set cursorline          " Show cursorline
set ttyfast
set expandtab
set autoindent
set fileformat=unix
set tabstop=2
set softtabstop=2
set shiftwidth=2
set foldcolumn=2
set mouse=a

" Keybindings
"
let mapleader=","

" Plugins
"
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader><TAB> <C-w><C-w>

nmap <leader>l <Plug>(ale_fix)                " Lint file
" nmap <silent><C-k> <Plug>(ale_previous_wrap)  " Jump to previous linting error
" nmap <silent><C-j> <Plug>(ale_next_wrap)      " Jump to next linting error

map <leader>f <Plug>(easymotion-bd-f)
map <Leader>j <Plug>(easymotion-bd-jk)
map <Leader>k <Plug>(easymotion-bd-jk)

nnoremap <leader>G :Goyo<CR>

nnoremap <leader>g :GitGutterToggle<CR>

" disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" enable mouse and scrolling
nnoremap <leader>m :set mouse-=a<CR>
nnoremap <leader>M :set mouse=a<CR>
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" keys for insert mode
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
imap <C-X> <del>

" Faster moving in normal mode
nnoremap <C-j> 3j
nnoremap <C-k> 3k
nnoremap <C-h> b
nnoremap <C-l> w

nnoremap <leader>rb :w <CR> :! browser-sync reload<CR><CR>

" map <F8> :w <CR> :!clear && clang % && ./a.out <CR>
" nnoremap <F8> :w <CR> :te python3.5 ./% <CR>

nnoremap <leader>rc :source $MYVIMRC<CR>
noremap <space> za
noremap zA zR
noremap zC zM
nnoremap <leader>s :noh <CR>        " clear search highlight until next search
nnoremap <leader>w :w <CR>
vnoremap <leader>y "+y              " Yank/paste from clipboard
nnoremap <leader>p "+p

" buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
map <leader>b :b#<cr>          " go back to previous buffer
map <leader>q :bd<cr>          " close current buffer


nnoremap <silent> n   n:call customFunctions#HLNext(0.4)<cr>
nnoremap <silent> N   N:call customFunctions#HLNext(0.4)<cr>
