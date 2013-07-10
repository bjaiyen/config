" Bookkeeping {
  call pathogen#infect()            " Enable easier runtimepath management
  set nobackup                      " On file override, replace old backup
  set backupdir=~/.vim/backup       " Backup files location
  set directory=~/.vim/swap         " Directory for swap files
  set noswapfile                    " Create swap file with incremental changes
  set writebackup                   " On file override, do temporary backup

  set autoread                      " Automatically read changed files
  " Check for file changes when cursor moves or every so often
  autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI * :checktime
" }

" UI {
  command! CDC cd %:p:h             " Change to current file directory
  set backspace=indent,eol,start    " Fix backspace
  set hidden                        " Lets you switch buffers w/out saving
  set history=1000                  " Keep longer history

  " Makes vim autocomplete behave like bash autocomplete
  set wildmenu
  set wildmode=list:longest

  " The following simply creates an ambiguous mapping so vim fully processes the
  " escape sequence for terminal keys, see 'ttimeout' for a rough explanation. 
  " This is used to fix plugins that map <ESC> in order to fix arrow key
  " key-maps that look like OC and execute as three commands.
  if &term[:4] == "xterm" || &term[:5] == "screen"
    inoremap <silent> <C-[>OC <RIGHT>
    inoremap <silent> <C-[>OD <LEFT>
  endif
" }

" Appearance {
  colorscheme desert                " Set colorscheme
  set background=dark               " Tell vim background is dark
  set colorcolumn=81                " Show red column at 81 characters
  set laststatus=2                  " Always show status line
  set number                        " Line numbers
  set splitright                    " Create new split window on right side
  syntax enable                     " Syntax highlight w/out overriding current

  set statusline=%F%m%r%h%w[%{&ff}]%y[%02p%%][%L][%04l,%04v]
  "              | | | | |  |      |  |       |   |    |
  "              | | | | |  |      |  |       |   |    + current column
  "              | | | | |  |      |  |       |   |
  "              | | | | |  |      |  |       |   +-- current line
  "              | | | | |  |      |  |       +-- total lines in file
  "              | | | | |  |      |  +-- current % into file
  "              | | | | |  |      +-- current syntax in square brackets
  "              | | | | |  |
  "              | | | | |  +-- current fileformat
  "              | | | | +-- preview flag in square brackets
  "              | | | +-- help flag in square brackets
  "              | | +-- readonly flag in square brackets
  "              | +-- rodified flag in square brackets
  "              +-- full path to file in the buffer

  " Highlight whitespace at eol
  autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
  autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
  highlight EOLWS ctermbg=red guibg=red

  " Setup title to work with gnu screen
  if &term[:5] == "screen"
    " Change title whenever buffer is entered
    autocmd BufEnter * let &titlestring = expand("%:t")
    set t_ts=k
    set t_fs=\
  endif
  set title                         " Show title at top of window
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

  " Set filetype to txt if not already set
  autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif
" }

" Folding {
  set nofoldenable                  " Fold by default
  set foldignore=                   " Line start with chars use nearby fold lvl
  set foldlevel=1                   " Default fold level
  set foldmethod=indent             " Fold based on indent
  set foldnestmax=10                " Deepest fold is 10 levels

  " Change color of folds
  highlight Folded ctermfg=green guifg=green
" }

" Searching {
  set ignorecase                    " Ignore case while searching
  set incsearch                     " Incremental searching
  set smartcase                     " Cap letter means pattern is case sensitive
  set tags=./tags;                  " Search ./ then upwards until root for tags 

  " Follow `smartcase` when searching using * or #
  "nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
  "nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
" }

" Keymap {
  " Map ctrl-j to right arrow in insert mode
  inoremap <silent> <C-J> <RIGHT>

  " Toggle spellcheck
  nnoremap <silent> <F7> :setlocal spell! spelllang=en_us<CR>

  " Buffer switching
  nnoremap <silent> <C-J> :bp<CR>
  nnoremap <silent> <C-K> :bn<CR>

  " Open quickfix selection in vertical split and close quickfix window
  autocmd FileType qf nnoremap <buffer><silent> <CR> <C-W><CR><C-W>L:ccl<CR>
" }

" Plugins {
  " Toggle NERDTree
  nnoremap <silent> <C-N> :NERDTreeToggle<CR>
  let NERDTreeQuitOnOpen=1          " Quit NERDTree after opening file

  " Search for word under the cursor
  nnoremap <silent> <C-G> :Grep<CR><CR><CR>
  let Grep_Default_Options='-Irnis' " Default options for grep
" }
