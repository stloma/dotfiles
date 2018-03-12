"
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
Plugin 'alvan/vim-closetag'
Plugin 'ryanoasis/vim-devicons'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'mbbill/undotree'
Plugin 'majutsushi/tagbar'

call vundle#end()

"
" Set options
"
set nocompatible
set background=dark
colorscheme base16-atelier-sulphurpool
let g:airline_theme='base16'
set termguicolors
filetype plugin indent on
syntax on
set relativenumber
set number
let loaded_matchparen = 1
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set hidden
" Sets number of lines above and below cursor
set scrolloff=7
set cmdheight=2
set laststatus=2
set cursorline
set ttyfast
set expandtab
set autoindent
set fileformat=unix
set tabstop=2
set softtabstop=2
set shiftwidth=2
set foldcolumn=2
set mouse=a
set path+=**
set wildmenu
set encoding=utf-8
" folding, first two load/save on open/exit
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview
set foldlevel=99
highlight Search guibg=#782b14 guifg=#de917a
highlight IncSearch guibg=#782b14 guifg=#de917a

"
" Plugin Customization
"
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" remove padding after devicon
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" close vim if Nerdtree is only window open
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

set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ale_linters = { 'javascript': ['eslint'], 'scss': ['prettier'], 'python': ['flake8'], 'html': ['tidy'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'scss': ['prettier'], 'python': ['autopep8'], 'html': ['tidy'], 'java': ['google_java_format'] }
let g:ale_echo_msg_format = '%s [%linter%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'

let NERDTreeIgnore = [ '\.pyc$', 'cache$', '__pycache__$', 'node_modules$' ]
let g:airline_powerline_fonts = 1

" setup ALE error highligting highlights; uses base16-sulphurpool bg and fg
execute "highlight ALEErrorSign guifg=#c94922 guibg=#293256"

highlight CursorLineNr guifg=#ac9739

"
" Keybindings
"
let mapleader=","

" plugins
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader><TAB> <C-w><C-w>

nmap <leader>l <Plug>(ale_fix)
nmap <M-k> <Plug>(ale_previous_wrap)
nmap <M-j> <Plug>(ale_next_wrap)

map <C-f> <Plug>(easymotion-bd-f)
map <C-j> <Plug>(easymotion-j)
map <C-k> <Plug>(easymotion-k)

nnoremap <leader>G :Goyo<CR>

nnoremap <leader>g :GitGutterToggle<CR>

nnoremap <leader>t :TagbarToggle<CR>

nnoremap <leader>u :UndotreeToggle<CR>

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

" motion for insert mode
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>
imap <C-X> <del>

nnoremap <leader>r :w <CR> :! browser-sync reload<CR><CR>

" map <F8> :w <CR> :!clear && clang % && ./a.out <CR>
" nnoremap <F8> :w <CR> :te python3.5 ./% <CR>
autocmd FileType java nnoremap <F8> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<cr>

nnoremap <leader>rc :source $MYVIMRC<CR>
noremap <space> za
noremap zA zR
noremap zC zM
nnoremap <leader>w :w<CR>
nnoremap <leader>s :nohls <CR>
vnoremap <leader>y "+y
nnoremap <leader>p "+p

inoremap <leader>{  {<CR>}<Esc>O

nnoremap + j$

" buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
map <leader>b :b#<cr>
map <leader>q :bd<cr>
