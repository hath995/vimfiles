set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'blerins/flattown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'osyo-manga/vim-over'
Plugin 'marijnh/tern_for_vim'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kchmck/vim-coffee-script'
Plugin 'andviro/flake8-vim'
Plugin 'davidhalter/jedi-vim'
call vundle#end()            " required
filetype plugin indent on    " required


set omnifunc=syntaxcomplete#Complete
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 'on_hold'
set completeopt-=preview
autocmd FileType javascript map <buffer> gd :TernDef<CR>

syntax on
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set hidden
set listchars=tab:▸\ ,eol:¬
set list
colorscheme flattown
set backspace=indent,eol,start
set t_ut=
set laststatus=2
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#show_call_signatures=1

let g:PyFlakeOnWrite = 1
let g:PyFlakeMaxLineLength = 200
let g:PyFlakeRangeCommand = 'Q'

let g:over_enable_cmd_window = 1

map <C-n> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
noremap <C-TAB> :bnext<CR>
noremap <S-C-TAB> :bprev<CR>
function! ToggleForCopy()
    set list!
    set number!
    set relativenumber!
endfunction
nmap <silent> \p :call ToggleForCopy()<CR>
