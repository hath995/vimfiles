" .vimrc

source ~/.vim/bundlerc.vim

" -----------------------------------------------------
" Vim builtin configuration settings
" -----------------------------------------------------
" Autocompletion settings
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
" Syntax highlighting on
syntax on
" Show line numbers and motion line numbers
set number
set relativenumber
" Uses spaces instead of hard tabs
set expandtab
" Set tab width to default to 4 spaces
set tabstop=4
set shiftwidth=4
" Highlight terms searched with /
set hlsearch
" Allow buffers 
set hidden
" Show white space characters
set listchars=tab:▸\ ,eol:¬
set list
" Colors!
colorscheme flattown
" Sane defaults for insert mode backspace behavior
set backspace=indent,eol,start
" Solves color issue with background in GNU Screen
set t_ut=
" Always on status bar
set laststatus=2
" Highlight the line cursor is
set cursorline
" Highlight line length limit
set colorcolumn=120
highlight ColorColumn ctermbg=blue
" Ctag definition file
set tags+=.tags
" Code folding settings
set foldenable
set fdm=indent
set foldlevelstart=10
" Undofile saves edits across vim sessions
set undofile
set undodir=~/.vim/undo

" -----------------------------------------------------
" Plugin variable
" -----------------------------------------------------
" Javascript autocompletion plugin settings
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 'on_hold'
autocmd FileType javascript map <buffer> gd :TernDef<CR>

" NerdTree ignores certain filetypes
let NERDTreeIgnore = ['\.pyc$']

" Sublime Text like multicursor settings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Python autocompletion plugin settings
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#show_call_signatures=1

" Python lint plugin settings
let g:PyFlakeOnWrite = 1
let g:PyFlakeMaxLineLength = 120
let g:PyFlakeRangeCommand = 'Q'

" Airline plugin settings
let g:over_enable_cmd_window = 1
let g:airline#extensions#branch#enabled = 1

" Indent guide setup
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239

" Ocaml autocompletion plugin setup (Merlin)
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute 'set rtp+=' . g:opamshare . '/merlin/vim'

call camelcasemotion#CreateMotionMappings(',')
nmap <F8> :TagbarToggle<CR>

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>b :Gblame<cr>
nnoremap <leader>u :MundoToggle<CR>

" Quick window motion mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Neovim terminal mappings (re-enable for neovim)
tnoremap <Esc> <C-\><C-n>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Remove line number information for old vim copy and paste
function! ToggleForCopy()
    set list!
    set number!
    set relativenumber!
endfunction
nmap <silent> \p :call ToggleForCopy()<CR>

" -----------------------------------------------------
" Unite Configuration
" -----------------------------------------------------

" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
call unite#filters#sorter_default#use(['sorter_rank'])

" File sources should ignore globs
call unite#custom#source('file,file_rec,file_rec/async,file_rec/neovim', 'ignore_pattern', 'bundle\|node_modules\|bower_components\|\.git\|\.hg\|\.svn\|\.hg')

" File sources should only use project files
call unite#custom#source('file,file_rec,file_rec/async,file_rec/neovim', 'matchers', ['matcher_project_ignore_files', 'converter_relative_word', 'matcher_fuzzy'])

" Custom profile
call unite#custom#profile('default', 'context', {
      \   'prompt': '» ',
      \   'winheight': 15,
      \ })

" Add syntax highlighting
let g:unite_source_line_enable_highlight=1

" Dont override status line
let g:unite_force_overwrite_statusline=0

" Custom unite menus
let g:unite_source_menu_menus = {}

" Git menu
let g:unite_source_menu_menus.git = {
      \     'description' : 'Git commands',
      \ }
let g:unite_source_menu_menus.git.command_candidates = [
      \       ['Stage hunk', 'GitGutterStageHunk'],
      \       ['Unstage hunk', 'GitGutterRevertHunk'],
      \       ['Stage', 'Gwrite'],
      \       ['Status', 'Gstatus'],
      \       ['Diff', 'Gvdiff'],
      \       ['Commit', 'Gcommit --verbose'],
      \       ['Revert', 'Gread'],
      \       ['Log', 'Glog'],
      \       ['Visual log', 'Gitv'],
      \       ['Current file visual log', 'Gitv!'],
      \     ]

" Plug menu
let g:unite_source_menu_menus.plug = {
      \     'description' : 'Plugin management commands',
      \ }
let g:unite_source_menu_menus.plug.command_candidates = [
      \       ['Install plugins', 'PlugInstall'],
      \       ['Update plugins', 'PlugUpdate'],
      \       ['Clean plugins', 'PlugClean'],
      \       ['Upgrade vim-plug', 'PlugUpgrade'],
      \     ]

" Tag source settings
let g:unite_source_tag_max_name_length=40
let g:unite_source_tag_max_fname_length=50
"}}}

" -----------------------------------------------------
" Unite Mappings
" -----------------------------------------------------

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <silent> <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-k> <Plug>(unite_select_previous_line)
  " Runs 'splits' action by <C-s> and <C-v>
  imap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " Exit with escape
  nmap <silent> <buffer> <ESC> <Plug>(unite_exit)
  " Mark candidates
  vmap <silent> <buffer> m <Plug>(unite_toggle_mark_selected_candidates)
  nmap <silent> <buffer> m <Plug>(unite_toggle_mark_current_candidate)
endfunction
" Search files recursively ([o]pen file)
 nnoremap <silent> <leader>o  :execute 'Unite -buffer-name=file-recursive-search -start-insert file_rec/neovim'<CR>
" Search files recursively ([O]pen file)
 nnoremap <silent> <leader>O  :execute 'Unite -buffer-name=file-recursive-search -start-insert file_rec/async'<CR>
" " Browse [f]iles in CWD
 nnoremap <silent> <leader>f :execute 'Unite -buffer-name=project-files -start-insert file'<CR>
" " [U]nite sources
" nnoremap <silent> <leader>u :call utils#uniteSources()<CR>
" " Search between open files - buffers
 nnoremap <silent> <leader>l :execute 'Unite -buffer-name=buffers -start-insert buffer'<CR>
" " Search in current file ou[t]line (tags in current file)
" nnoremap <silent> <leader>t :call utils#uniteTags()<CR>
" " Search in lines on current buffer
 nnoremap <silent> <leader>/ :execute 'Unite -buffer-name=line-search -start-insert line'<CR>
" " Search in [y]ank history
 nnoremap <silent> <leader>y :execute 'Unite -buffer-name=yank-history history/yank'<CR>
" " Search in [r]egisters
 nnoremap <silent> <leader>r :execute 'Unite -buffer-name=registers register'<CR>
" " Search in opened [w]indow splits
 nnoremap <silent> <leader>w :execute 'Unite -buffer-name=splits window'<CR>
" " Search in latest [j]ump positions
 nnoremap <silent> <leader>j :execute 'Unite -buffer-name=jumps -start-insert jump'<CR>
" " Search in file for text with [g]rep
 nnoremap <silent> <C-p> :execute 'Unite -buffer-name=grep -start-insert grep'<CR>
" " Search in my custom unite [m]enu with my commands
 nnoremap <silent> <leader>m :execute 'Unite -buffer-name=menu -start-insert menu'<CR>
" " Seach in help menu for commands
 nnoremap <silent> <leader>hc :execute 'Unite -buffer-name=commands -start-insert command'<CR>
" " Seach in help menu for mappings
 nnoremap <silent> <leader>hm :execute 'Unite -buffer-name=mappings -start-insert mapping'<CR>
" " Search for pattern in open buffers
 nnoremap <silent><leader>a :execute 'Unite -buffer-name=grep_all_buffers  -start-insert grep:$buffers::'<CR>

"}}}



" -----------------------------------------------------
" On vim exit
" -----------------------------------------------------
au VimLeave * !echo -ne "\033[0m"
