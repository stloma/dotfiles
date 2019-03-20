"
" Vundle Setup
"
set rtp+=$HOME/.config/vundle/Vundle.vim
call vundle#begin('$HOME/.config/vundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'krisajenkins/vim-postgresql-syntax'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'gregsexton/matchtag'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'mbbill/undotree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mhinz/vim-grepper'
Plugin 'vimwiki/vimwiki'

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
set list
set listchars=tab:\ \ ,trail:\ ,
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
autocmd BufWinLeave ?* mkview 1
autocmd BufWinEnter ?* silent! loadview 1
set foldlevel=99
highlight Search guibg=#782b14 guifg=#de917a
highlight IncSearch guibg=#782b14 guifg=#de917a
highlight markdownCodeBlock none

"
" Plugin Customization
"
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" remove padding after devicon
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" close vim if Nerdtree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "~",
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
let g:ctrlp_cmd = 'CtrlPMRU'

source ~/.config/nvim/dbext.conf

function! DBextPostResult(db_type, buf_nr)
  " If dealing with a Postgres database
  if a:db_type == 'PGSQL'
    set filetype=postgresql
  endif
endfunction

set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ale_linters = {
\ 'c': ['cppcheck'],
\ 'javascript': ['eslint'],
\ 'scss': ['prettier'],
\ 'python': ['flake8'],
\ 'html': ['tidy'],
\}

" \ 'c': ['uncrustify'],
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['prettier'],
\ 'scss': ['prettier'],
\ 'python': ['autopep8'],
\ 'html': ['tidy'],
\ 'java': ['google_java_format'],
\}
let g:ale_virtualenv_dir_names = ['.venv', '~/.local/bin']
let g:ale_echo_msg_format = '%s [%linter%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'

let NERDTreeIgnore = [ '\.pyc$', 'cache$', '__pycache__$', 'node_modules$' ]
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0

" setup ALE error highligting highlights; uses base16-sulphurpool bg and fg
execute "highlight ALEErrorSign guifg=#c94922 guibg=#293256"

highlight CursorLineNr guifg=#ac9739

"  Whitespace highlights for nbsp, space, tab and trail
highlight Trail guibg=#782b14
call matchadd('Trail', '\s\+$', 100)

"
" Keybindings
"
let mapleader=","
noremap \ ,

" plugins

highlight VimwikiHeader1 guifg=#c08b30

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader><TAB> <C-w><C-w>

nmap <leader>l <Plug>(ale_fix)
nmap <M-k> <Plug>(ale_previous_wrap)
nmap <M-j> <Plug>(ale_next_wrap)

map <C-f> <Plug>(easymotion-bd-f)
map <C-j> <Plug>(easymotion-j)
map <C-k> <Plug>(easymotion-k)

nnoremap <leader>G :Goyo<CR>
nnoremap <leader>aw :AirlineToggleWhitespace<CR>

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

nnoremap <leader>rc :source $MYVIMRC<CR>
noremap <space> za
noremap zA zR
noremap zC zM
nnoremap <C-s> :w<CR>
nnoremap <leader><CR> :noh<CR>
vnoremap <leader>y "+y
nnoremap <leader>p "+p

inoremap <C-Space> <Esc>l

inoremap <leader>{  {<CR>}<Esc>O

nnoremap + j$

" buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
map <leader>b :b#<cr>
map <leader>q :bd<cr>

":Prep \Cpermissions => case sensitive search for permissions
command! -nargs=1 Pgrep vimgrep "<args>" $PWD/**/*.py
nnoremap <leader>P :Pgrep

" filetype specific
autocmd FileType python nnoremap <F8> :w<CR>:exec '!/usr/bin/env python3' shellescape(@%, 1)<cr>
autocmd FileType c nnoremap <F8> :ALEDisable<CR>:w<CR>:exec '!gcc -w % && ./a.out'<CR>
autocmd FileType cpp nnoremap <F8> :w<CR>:exec '!g++ -w % && ./a.out'<CR>
autocmd FileType java nnoremap <F8> :w <CR>:exec '!javac % && java' shellescape(expand('%:r'), 1)<cr>
autocmd FileType sql nnoremap <F8>:DBExecSQLUnderCursor<cr>
autocmd FileType sql vnoremap <F8>:DBExecRangeSQL<cr>

" Close quickfix
autocmd FileType qf nnoremap <buffer><silent> <esc> :quit<cr>

autocmd FileType markdown nnoremap <F8> :call MarkdownToPdf()<cr>
autocmd FileType markdown imap <leader><leader><space> $\Rightarrow$
autocmd FileType markdown imap <leader><leader>l \begin{center}\rule{0.9\textwidth}{.4pt}\end{center}<ESC>F9

function! MarkdownToPdf()
  let l:out = '/src/out'
  let l:in = '/src/in'

  let l:templatename = 'eisvogel.tex'
  let l:templatedir = l:in . "/" . l:templatename
  let l:filename = l:out . "/" . fnameescape(expand('%:t'))
  let l:pdfout = l:out . "/" . fnameescape(expand('%:t:r')) . ".pdf"
  let l:pdfname = fnameescape(expand('%:p:r')) . ".pdf"
  let l:containername = 'arch-pandoc'

  let l:pwd = fnameescape(expand('%:p:h'))
  let l:outvol = fnameescape(expand('%:p:h')) . ":/src/out"
  let l:invol = "/home/lockwood/.config/pandoc:/src/in"

  execute "!docker run --rm
        \ -v" l:outvol"
        \ -v" l:invol"
        \ " l:containername "
        \ --from markdown --template" l:templatedir"
        \ --listings -o" l:pdfout l:filename
  execute "!qpdfview" l:pdfname
endfunction


let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }
