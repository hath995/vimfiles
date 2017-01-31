set nocompatible              " be iMproved, required
filetype off                  " required

" -----------------------------------------------------
" Vundle plugin setup
" -----------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bkad/CamelCaseMotion'           " Adds motion for camelcase or snakecase names
Plugin 'blerins/flattown'               " Color scheme
Plugin 'scrooloose/nerdtree'            " File tree graphical browser
Plugin 'scrooloose/nerdcommenter'       " Language aware comment hotkeys
Plugin 'bling/vim-airline'              " Nice looking status line
Plugin 'tpope/vim-surround'             " Easily manipulate paired delimiters
Plugin 'osyo-manga/vim-over'            " Fancy Regular expression matching and highlighting
Plugin 'marijnh/tern_for_vim'           " Javascript type and autocompletion library
Plugin 'vim-scripts/argtextobj.vim'     " Text object for function arguments
Plugin 'terryma/vim-multiple-cursors'   " Sublime Textlike Multi-cursor plugin
Plugin 'kchmck/vim-coffee-script'       " Coffeescript syntax highlighting
Plugin 'andviro/flake8-vim'             " Python linting tool
Plugin 'davidhalter/jedi-vim'           " Python autocompletion and refactoring tools
Plugin 'Shougo/vimproc.vim'             " Dependency of many Shougo plugins
Plugin 'Quramy/tsuquyomi'               " Typescript autocompletion framework
Plugin 'leafgarland/typescript-vim'     " Typescript syntax highlighting
Plugin 'simnalamburt/vim-mundo.git'     " Visual graph of file change history
Plugin 'tpope/vim-fugitive'             " Git integration
Plugin 'tpope/vim-unimpaired'           " Various convient mappings
Plugin 'duff/vim-scratch'               " Easy scratch buffer
Plugin 'kana/vim-textobj-user'          " Kana's text object framework
Plugin 'kana/vim-textobj-line'          " Adds line text object
Plugin 'kana/vim-textobj-indent'        " Adds indent text object
Plugin 'bps/vim-textobj-python'         " Adds python text object
Plugin 'nelstrom/vim-textobj-rubyblock' " Adds ruby text object
Plugin 'jeetsukumaran/vim-buffergator' " Quick buffer switch
"Plugin 'xolox/vim-misc'                " Dependency of vim-easytags
"Plugin 'xolox/vim-easytags'            " Ctags
Plugin 'majutsushi/tagbar'             " Graphical ctag navigator
Plugin 'junegunn/vim-peekaboo'         " Shows register contents on register action
Plugin 'eagletmt/ghcmod-vim'           " Haskell syntax and autocomplete
Plugin 'Shougo/unite.vim'              " Unified quick searching system
Plugin 'Shougo/neoyank.vim'            " Yank buffer history
Plugin 'airblade/vim-gitgutter'        " Git diff highlighting
Plugin 'fsharp/vim-fsharp'             " F# tools
Plugin 'easymotion/vim-easymotion.git' " Powerful quick motion command
Plugin 'moll/vim-node'                 " Nodejs integration
Plugin 'nathanaelkane/vim-indent-guides' " Visual guide to indentation
Plugin 'kien/rainbow_parentheses.vim'  "Colors parentheses for easier nesting
Plugin 'editorconfig/editorconfig-vim' "Vim will follow editor config files
Plugin 'vim-ruby/vim-ruby'             "Add niceer ruby suport


call vundle#end()            " required
filetype plugin indent on    " required

