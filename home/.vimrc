" Vundle {
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " Set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'gmarik/Vundle.vim'

  " Keep Plugin commands between vundle#begin/end
  Plugin 'Raimondi/delimitMate'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'ap/vim-buftabline'
  Plugin 'kien/ctrlp.vim'
  Plugin 'milkypostman/vim-togglelist'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-markdown'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-scripts/AfterColors.vim'
  Plugin 'vim-scripts/a.vim'
  Plugin 'vim-scripts/bufexplorer.zip'
  Plugin 'vim-scripts/matchit.zip'

  call vundle#end()            " required
  filetype plugin indent on    " required
" }


" Bookkeeping {
  set autoread                      " Automatically read changed files
  set backspace=indent,eol,start    " Fix backspace
  set nobackup                      " On file override, replace old backup
  set backupdir=~/.vim/backup       " Backup files location
  set directory=~/.vim/swap         " Directory for swap files
  set hidden                        " Lets you switch buffers w/out saving
  set history=1000                  " Keep longer history
  set splitright                    " Create new split window on right side
  set noswapfile                    " Create swap file with incremental changes
  set writebackup                   " On file override, do temporary backup

  " Makes vim autocomplete behave like bash autocomplete
  set wildmenu
  set wildmode=list:longest
" }


" Folding {
  set nofoldenable                  " Don't fold by default
  set foldignore=                   " Ignore default nearby folding with #
  set foldlevel=1                   " Default fold level
  set foldmethod=indent             " Fold based on indent
  set foldnestmax=10                " Deepest fold is 10 levels

  " Change color of folds
  hi Folded ctermfg=green guifg=green
" }


" Formatting {
  filetype indent on                " Enables indent style for detected filetype
  filetype plugin on                " Enables plugin for detected filetype
  set autoindent                    " New line copies indention from prev line
  set expandtab                     " Use of spaces instead of tabs
  set linebreak                     " Linebreak only when enter pressed
  set shiftwidth=2                  " Indent spaces with >> or <<
  set smartindent                   " Adds extra indention in some cases
  set smarttab                      " Tab expand/del at beginning of line
  set softtabstop=2                 " Number of spaces per tab in insert mode
  set tabstop=2                     " Number of spaces displayed per tab
  set textwidth=80                  " Wrap text at 80 characters
  set wrap                          " Wrap text in display window
" }


" Searching {
  set ignorecase                    " Ignore case while searching
  set incsearch                     " Incremental searching
  set smartcase                     " Cap letter means pattern is case sensitive
  set tags=./tags;                  " Search ./ then upwards until root for tags
" }


" UI {
  colorscheme desert                " Set colorscheme
  set background=dark               " Tell vim background is dark
  set colorcolumn=80                " Show red column at 80 characters
  set number                        " Line numbers
  set showmode                      " Show which mode you are in (e.g. paste)
  set title                         " Show title at top of window
  syntax enable                     " Syntax highlight w/out overriding current
" }


" Auto Commands {
  " Check for file changes when cursor moves or every so often
  au BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI * :checktime

  " Highlight whitespace at eol
  au InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
  au InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
  hi EOLWS ctermbg=red guibg=red

  " Set filetype to txt if not already set
  au BufEnter * if &filetype == "" | setlocal ft=txt | endif

  " Open quickfix selection (in split) and close quickfix window
  au FileType qf nnoremap <buffer><silent> <CR> <CR>:ccl<CR>
  au FileType qf nnoremap <buffer><silent> <C-W><CR> <C-W><CR>:ccl<CR>
  au FileType qf nnoremap <buffer><silent> <leader><CR> <C-W><CR><C-W>L:ccl<CR>
" }


" Custom Commands/Keymap {
  command! CDC cd %:p:h             " Change to current file directory

  " Map ctrl-j to right arrow in insert mode
  inoremap <silent> <C-J> <RIGHT>

  " Buffer switching
  nnoremap <silent> <C-H> :bp<CR>
  nnoremap <silent> <C-J> :bn<CR>

  " Toggle paste
  nnoremap <F2> :set invpaste paste?<CR>
  set pastetoggle=<F2>

  " Toggle spellcheck
  nnoremap <silent> <F7> :setlocal spell! spelllang=en_us<CR>
" }


" Status Line {
  set laststatus=2                  " Always show status line
  set statusline=%F%=[%{&ff}]%y[%02p%%][%L][%04l,%04v]
  "              |    |      |  |       |   |    |
  "              |    |      |  |       |   |    + current column
  "              |    |      |  |       |   +-- current line
  "              |    |      |  |       +-- total lines in file
  "              |    |      |  +-- current % into file
  "              |    |      +-- current syntax in square brackets
  "              |    +-- current fileformat
  "              +-- full path to file in the buffer

  " vim-fugitive git branch
  set statusline+=%{fugitive#statusline()}

  " syntastic error message
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
" }


" Compatibility {
  " Setup block cursor in cygwin
  if has("win32unix")
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
  endif

  " Setup title to work with gnu screen
  if &term[:5] == "screen"
    " Change title whenever buffer is entered
    au BufEnter * let &titlestring = expand("%:t")
    set t_ts=k
    set t_fs=\
  endif

  " The following simply creates an ambiguous mapping so vim fully processes the
  " escape sequence for terminal keys, see 'ttimeout' for a rough explanation.
  " This is used to fix plugins that map <ESC> in order to fix arrow key
  " key-maps that look like OC and execute as three commands.
  if &term[:4] == "xterm" || &term[:5] == "screen"
    inoremap <silent> <C-[>OC <RIGHT>
    inoremap <silent> <C-[>OD <LEFT>
  endif
" }


" Plugins
  " <nerdtree>
  " Toggle NERDTree
  nnoremap <silent> <C-N> :NERDTreeFind<CR>
  let NERDTreeShowHidden=1          " Show hidden files
  let NERDTreeQuitOnOpen=1          " Quit NERDTree after opening file

  " <syntastic>
  " Let syntastic put errors in location-list
  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_auto_loc_list=0   " Don't enable location-list automatically
  let g:syntastic_check_on_open=1   " Check syntax on Buffer open
  let g:syntastic_check_on_wq=0     " Check syntax on Buffer write

  " <vim-buftabline>
  let g:buftabline_indicators=1     " Show buffer state
  let g:buftabline_numbers=1        " Show buffer number
" }
