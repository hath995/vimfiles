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
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'simnalamburt/vim-mundo.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'duff/vim-scratch'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-indent'
Plugin 'bps/vim-textobj-python'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'fsharp/vim-fsharp'

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
set cursorline
set colorcolumn=120
highlight ColorColumn ctermbg=blue
set foldenable
set fdm=indent
set foldlevelstart=10

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
let g:airline#extensions#branch#enabled = 1

let g:buffergator_suppress_keymaps=1
let g:buffergator_viewport_split_policy='T'
nnoremap <leader>l :BuffergatorToggle<CR>

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>b :Gblame<cr>
nnoremap <leader>u :GundoToggle<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
tnoremap <Esc> <C-\><C-n>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

function! ToggleForCopy()
    set list!
    set number!
    set relativenumber!
endfunction
nmap <silent> \p :call ToggleForCopy()<CR>
au VimLeave * !echo -ne "\033[0m"
