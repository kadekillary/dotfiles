"    .o oOOOOOOOo                                            0OOOo
"    Ob.OOOOOOOo  OOOo.      oOOo.                      .adOOOOOOO
"    OboO000000000000.OOo. .oOOOOOo.    OOOo.oOOOOOo..0000000000OO
"    OOP.oOOOOOOOOOOO 0POOOOOOOOOOOo.   `0OOOOOOOOOP,OOOOOOOOOOOB'
"    `O'OOOO'     `OOOOo"OOOOOOOOOOO` .adOOOOOOOOO"oOOO'    `OOOOo
"    .OOOO'            `OOOOOOOOOOOOOOOOOOOOOOOOOO'            `OO
"    OOOOO                 '"OOOOOOOOOOOOOOOO"`                oOO
"   oOOOOOba.                .adOOOOOOOOOOba               .adOOOOo.
"  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO
"  OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOO"`  '"OOOOOOOOOOOOO.OOOOOOOOOOOOOO 
"    Y           'OOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?'         :`
"    :            .oO%OOOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .
"    .            oOOP"%OOOOOOOOoOOOOOOO?oOOOOO?OOOO"OOo
"                 '%o  OOOO"%OOOO%"%OOOOO"OOOOOO"OOO':
"                      `$"  `OOOO' `O"Y ' `OOOO'  o             .
"    .                  .     OP"          : o     .
"


" << STARTERS >> {{{

filetype indent plugin on
set encoding=utf-8
scriptencoding utf-8

if !exists('g:syntax_on')
  syntax enable
endif

if has('termguicolors')
    set termguicolors
endif

let g:mapleader = "\<Space>"
set cursorline          " show cursorline
" set colorcolumn=80
" }}}


" << PLUGINS >> {{{

call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'                                                     " Async Linting
Plug 'scrooloose/nerdcommenter'                                     " Easy commenting
Plug 'Raimondi/delimitMate'                                         " Automatic delimiters
Plug 'tpope/vim-surround'                                           " Operations around surrounding
Plug 'wellle/targets.vim'                                           " Additional text objects
Plug 'rizzatti/dash.vim'                                            " Integartion with Dash
Plug 'matze/vim-move'                                               " Easily move lines
Plug 'python-mode/python-mode', { 'for': 'python' }                 " Enhancements for Python
Plug 'scrooloose/nerdtree'                                          " File tree
Plug 'airblade/vim-gitgutter'                                       " Track git changes
" Plug 'Yggdroot/indentline'                                          " Visual indent lines
" Plug 'BurningEther/iron.nvim', { 'do': ':UpdateRemotePlugins' }     " Repls for various languages
" Plug 'jalvesaq/Nvim-R'                                              " Enhancements for R

" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Deoplete - completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Language Support
Plug 'rust-lang/rust.vim', { 'for': 'rust' }                        " Enhancements for Rust
Plug 'Shougo/neco-vim', { 'for': 'vim' }                            " Vim script support / linting
Plug 'Hyleus/vim-python-syntax', { 'for': 'python' }                " Python syntax, supports PythonDocstring
" Plug 'gaalcaras/ncm-R'                                              " R auto-completion
" Plug 'davidhalter/jedi'

" colorschemes
Plug 'kadekillary/subtle_solo'

call plug#end()
"

" << COLORSCHEMES >>
set background=dark

colorscheme subtle_dark
" }}}


" << STATUSLINE >> {{{


" Function: display errors from Ale in statusline
" function! LinterStatus() abort
   " let l:counts = ale#statusline#Count(bufnr(''))
   " let l:all_errors = l:counts.error + l:counts.style_error
   " let l:all_non_errors = l:counts.total - l:all_errors
   " return l:counts.total == 0 ? '' : printf(
   " \ 'Warn: %d Err: %d',
   " \ l:all_non_errors,
   " \ l:all_errors
   " \)
" endfunction



set laststatus=0
" set statusline=
" set statusline+=\ %F\ %*                                         " Show filename
" set statusline+=\ %m                                             " Show file modification indicator
" set statusline+=%=                                               " Switch sides
" set statusline+=\ %{LinterStatus()}                              " Show ALE lint warnings / errors
" set statusline+=\ branch(%{gitbranch#name()})\                   " Show Git branch
" }}}


" << NETRW >> {{{

let g:netrw_liststyle = 3                                        " Tree style
let g:netrw_banner = 0                                           " No banner
let g:netrw_browse_split = 1
let g:netrw_winsize = 20
let g:netrw_altv = 1
" }}}


" << NERD COMMENTER >> {{{

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
"  }}}


" << INDENT LINE >> {{{

" let g:indentLine_char = '¦'
" subtle_light
" let g:indentLine_color_gui = '#eee8d5'
" subtle_dark
" let g:indentLine_color_gui = '#073642'
" subtle_light - cterm
" let g:indentLine_color_term = 7
" }}}


" << LSP >> {{{

let g:LanguageClient_autoStart = 1

" Manually start LSP
" nnoremap <leader>lcs :LanguageClientStart<CR>

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls', '-v'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'] }


noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
" }}}


" << DEOPLETE >> {{{

let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({ 'auto_complete_delay': 3, 'max_list': 50 })

let g:deoplete#sources#rust#racer_binary='/Users/Kade.Killary/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/Kade.Killary/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

" nmap <buffer> gd <plug>DeopleteRustGoToDefinitionSplit
" nmap <buffer> K  <plug>DeopleteRustShowDocumentation
" }}}



" << RUST >> {{{

let g:rustc_path = '/Users/Kade.Killary/.cargo/bin/rustc'
let g:rustfmt_autosave = 1
" }}}


" << IRON.VIM >> {{{

" let g:iron_repl_open_cmd = 'vsplit'
" let g:iron_map_defaults = 0

" nmap + <Plug>(iron-send-motion)
" vmap + <Plug>(iron-send-motion)
" nmap rr <Plug>(iron-repeat-cmd)
" }}}


" << R >> {{{

" Resize R console based on window width
" augroup R_Resize
	" autocmd!
	" autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
" augroup END

" let g:Rout_more_colors = 1
" let g:rout_follow_colorscheme = 1
" let g:R_start_libs = 'base, stats, graphics, grDevices, utils, methods, tidyverse'

" nmap , <Plug>RDSendLine
" vmap , <Plug>RDSendSelection
" vmap ,e <Plug>RESendSelection
" nmap ,p <Plug>RPrintObj
" }}}


" << PYTHON >> {{{

" pymode
let g:pymode_syntax_all = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_indent = 1                     " PEP-8 compatible indent
let g:pymode_python='python3'
let g:pymode_options_colorcolumn = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_virtualenv = 1
" }}}


" << NERDTREE >> {{{

let g:NerdTreeCascadeSingleChildDir = 0
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeShowBookmarks = 1
map <leader>nt :NERDTreeToggle<CR>
" }}}


" << FILETYPE >> {{{

augroup FileOptions
  autocmd!
  " indentation
  " (for comments moving to BOL): https://stackoverflow.com/questions/2063175/comments-go-to-start-of-line-in-the-insert-mode-in-vim
  autocmd Filetype go setlocal nolist noet sts=0 sw=0
  autocmd Filetype python setlocal sts=4 sw=4 wrap
  " autocmd Filetype r setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype r setlocal ts=2 sw=2
  autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 syntax=javascript
  " https://calebthompson.io/crontab-and-vim-sitting-in-a-tree
  autocmd Filetype crontab setlocal nobackup nowritebackup
augroup END
" }}}


" << ALE >> {{{

let g:ale_enabled = 1
let g:ale_sign_error = '✖︎'
highlight ALEErrorSign guifg=red ctermfg=red
let g:ale_sign_warning = '✔︎'
highlight ALEWarningSign guifg=grey ctermfg=grey
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:move_key_modifier = 'N'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
" let g:ale_sign_column_always = 1                " ale enabled
" }}}


" << FOLDING >> {{{

augroup Folding
  autocmd!
  autocmd BufRead * setlocal foldmethod=marker    " using   fold method
  autocmd BufRead * normal zM
augroup END
" }}}


" << BASICS >> {{{

if exists('&inccommand')
    set inccommand=split " (neovim) specific, live substitutin preview
endif

" Keep the bottom clean / clear
set noruler             " turn off line, column numbers
set noshowmode          " don't show current mode
set noshowcmd           " don't show command

set nowrap              " don't wrap lines
set t_Co=256
set history=100         " lines of history VIM remembers
set guicursor=a:blinkon0      " disable cursor blink
set autochdir           " change working directory to current file
set shortmess=a         " get ride of annoying Enter/command prompt
set cmdheight=1         " height of command bar
set smarttab
set tabstop=4           " tab is four spaces
set softtabstop=4       " tab removed like spaces
set shiftwidth=4        "  number of spaces for autoindenting
set expandtab           " spaces instead of tab characters
set shiftround
set autoindent
set autochdir           " change current dir to file in viewed buffer
set scrolloff=5         " lines after/before cursor on scroll
set breakindent         " long lines will wrap with indentation
set showbreak=\\\\\     " wrap lines with indentation
set backspace=indent,eol,start " allow backspacing in insert mode
set infercase           " smarter completions that will be case aware
set smartcase           " ignore case if search pattern all lowercase
set autowrite           " save on buffer switch
set showmatch           " highlight matching [{()}]
set incsearch           " search characters as enetered
set hlsearch            " highlight matches
set foldenable          " enable folding
set mouse=a             " enable mouse
set hidden              " buffers exist without windows 
set number              " show line number
set relativenumber      " show relative line number set nobackup            " take care of backup files
set nobackup
set nowritebackup         " no backup files
set noswapfile          " no swap files
set lazyredraw          " redraw onlw when needed
" set fillchars+=vert:\   " get rid of vert split '|' character
" set smartindent       " like autoindent, but smarter about C -> deprecated
" }}}


" << TEMPLATES >> {{{

augroup FileTemplates
    autocmd!
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/sh.skeleton
augroup END
" }}}



" << KEY MAPPINGS >> {{{

" Vim Move <CTRL> binding
let g:move_key_modifier = 'C'

" <TAB> to select from popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Auto-insert shebangs
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" quick subtitutions
nnoremap <leader>s :%s/

" Echo path current directory
nnoremap <silent> <F2> :lchdir %:p:h<CR>:pwd<CR>

" HackerNews
" nnoremap <leader>hn :HackerNews<CR><CR>

" Remove search highlighting
nnoremap <silent> <BS> :nohlsearch<CR>

" Dumb - just use 0
" nnoremap H ^

" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" <Leader>T = Delete all Trailing space in file
nnoremap <Leader>T :%s/\s\+$//<CR>:let @/=''<CR>:nohlsearch<CR>

" fast saves
nnoremap <leader>w :w!<CR>

" exit quickly
nnoremap <leader>q :q!<CR>

" escaping various modes
if has ('nvim')
	" get out of terminal with same
	" window movement key bindings
	tnoremap jk		<C-\><C-n><CR>
	tnoremap <C-[>  <C-\><C-n><CR>
    tnoremap <C-W>h <C-\><C-n><C-w>h<CR>
    tnoremap <C-W>j <C-\><C-n><C-w>j<CR>
    tnoremap <C-W>k <C-\><C-n><C-w>k<CR>
    tnoremap <C-W>l <C-\><C-n><C-w>l<CR>
endif

" list all current buffers
nnoremap <leader>bb :ls<CR>:b<Space>
" close buffer
nnoremap <leader>bc :bd<CR>
" move to next buffer
nnoremap <leader>bn :bn<CR>
" previous buffer
nnoremap <leader>bp :bp<CR>

" ignite Dash search
nmap <silent> <leader>d <Plug>DashSearch<CR>

" cursor only in active window
"augroup Cursoractive
    "au!
    "autocmd VimEnter, WinEnter, BufWinEnter * set local cursorline
    "autocmd WinLeave * setlocal nocursorline
"augroup END

" automatic resized windows
augroup on_vim_resized
    autocmd!
    autocmd VimResized * wincmd =
augroup END

" execute shell commands in buffer
nnoremap Q !!$SHELL <CR>

" init.vim editing
map <leader>- :e $HOME/.config/nvim/init.vim<CR>

" source init.vim
map <silent> <F1> :source $HOME/.config/nvim/init.vim<CR>