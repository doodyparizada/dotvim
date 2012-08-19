" Great sources & credits:
" Example vimrc - http://www.vi-improved.org/vimrc.php
" gmarik - https://github.com/gmarik/vimfiles/blob/master/vimrc
" durdn - https://github.com/durdn/cfg/blob/master/.vimrc
" FactoryLab - https://github.com/factorylabs/vimfiles
" lukerandall - https://github.com/lukerandall/dotvim/blob/master/vimrc
" Graphical cheat sheet - http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html

" Initialization / Vundle Plugin Mangaer
set nocompatible  " Disable vi compatibility (more efficient, and besides - we're using non-vi tricks here).
set fileformats=unix,dos,mac  " Set file end-of-line priority.
filetype off

" Plugin manager initialization
if has ("win32")
    set runtimepath+=$HOME/vimfiles/bundle/vundle/
else
    set runtimepath+=$HOME/.vim/bundle/vundle/
endif

call vundle#rc()
Bundle "gmarik/vundle"
filetype plugin indent on  " Automatically detect file types, and enable file-type-specific plugins and indentation.


" Plugin bundles
" Web
Bundle "pangloss/vim-javascript"
Bundle "briangershon/html5.vim"
"Bundle "ChrisYip/Better-CSS-Syntax-for-Vim"
Bundle "css3"
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufWinEnter,FileType *.json,*jshintrc setfiletype javascript
autocmd BufWinEnter,FileType html,css set expandtab smarttab tabstop=2 softtabstop=2 shiftwidth=2  " FIXME: Doesn't work.

" Python
Bundle "django.vim"
Bundle "python.vim--Vasiliev"
Bundle "indentpython.vim"
let python_highlight_all=1  " Enable all plugin's highlighting.
let python_slow_sync=1  " For fast machines.
let python_print_as_function=1  " Color 'print' function.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufWinEnter,FileType python set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufWinEnter,FileType html setfiletype htmldjango  " Special syntax for html+django.
set wildignore+=*.pyc,*.pyo  " Ignore compiled Python files

" Haskell
"autocmd Bufenter *.hs compiler ghc  " FIXME: Generates an error.
Bundle "bitc/lushtags"
Bundle "Twinside/vim-haskellConceal"
Bundle "indenthaskell.vim"
"let g:haskell_indent_if=3
"let g:haskell_indent_case=5
"Bundle "haskell.vim"
Bundle "syntaxhaskell.vim"
let hs_highlight_boolean=1
let hs_highlight_types=1
let hs_highlight_debug=1
let hs_allow_hash_operator=1
set wildignore+=*.hi,*.o

" Markdown
Bundle "tpope/vim-markdown"

" Syntax Checking
Bundle "scrooloose/syntastic"
"Bundle "oryband/syntastic"
"let g:syntastic_mode_map = {
            "\ 'mode': 'active',
            "\ 'active_filetypes':  [],
            "\ 'passive_filetypes': [] }
let g:syntastic_enable_signs=1  " Show sidebar signs.
"let g:syntastic_auto_loc_list=1  " Auto open errors window upon detection.
set statusline+=%#warningmsg#  " Add Error ruler.
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <silent> ` :Errors<CR>

" NOTE: For Javascript:
"    1. Install exuberant-ctags & Node.js using your favorite package manager,
"    2. Install Node Package Manager (npm): Execute `curl http://npmjs.org/install.sh | sh` - See http://npmjs.org for more info.
"    3. Install jshint: Execute `npm install jshint`
"    4. Create a .jshintrc file @ your HOME dir (~/). Example: https://github.com/oryband/dotfiles/blob/master/jshintrc
"    5. Overwrite .vim/bundle/syntastic/syntax_checkers/javascript.vim with this one: https://github.com/oryband/dotvim/blob/master/syntax_checkers/javascript.vim  TODO: Find a way to not need this line.


" Other plugins
Bundle "AutoTag"
Bundle "scrooloose/nerdcommenter"
Bundle "camelcasemotion"
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"Bundle "ShowMarks"
" Only show alphabetic marks.
"let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Marks will be shown in format of 'm[mark char]' e.g. 'mA'.
"let g:showmarks_textlower="\.\t"
"let g:showmarks_textupper="\.\t"
"let g:showmarks_textother="\.\t"

Bundle "majutsushi/tagbar"
nnoremap <silent> \ :TagbarToggle<CR>
" Search tag list from current dir up till root.
set tags=./tags;/

Bundle "godlygeek/tabular"
Bundle "tpope/vim-unimpaired"
Bundle "fholgado/minibufexpl.vim"
let g:miniBufExplModSelTarget = 1  " Don't open buffer in a non-modifiable buffer (e.g. TagList window).
"let g:miniBufExplVSplit = 13  " Vertical column static width in chars
"let g:miniBufExplMaxSize = 2   " Vertical column max size.
"let g:miniBufExplForceSyntaxEnable = 1  " Use this if you encounter highlighting bugs (colors not changing).
" Colors override.
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg


" Status Line
"set statusline=  " FIXME: Reset status line here.
set shortmess=at  " Shortens messages in status line, truncates long messages.
set laststatus=2  " Always show status line.
set showcmd  " Display an incomplete command in status line.
set ruler  " Show file status ruler. NOTE: Doesn't work with buftabs.vim plugin.
"set ch=2  " Make command line two lines high


" Syntax
syntax on
autocmd BufWinEnter,FileType * set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4


" Searching & matching.
Bundle "IndexedSearch"
Bundle "AutoComplPop"
"set hlsearch  " Highlight search.
set smartcase  " Be case sensitive when input has a capital letter.
set incsearch  " Show matches while typing.
set ignorecase  " Ignore case when searching.
set wildignorecase  " In-case-sensitive dir/file completion.
set wildmenu  " Enable menu for commands
set wildmode=list:longest  " List options when hitting tab, and match longest common command.


" Colors
set t_Co=256  " Set terminal to display 256 colors.
Bundle "nanotech/jellybeans.vim"
"Bundle "chriskempson/vim-tomorrow-theme"
"Bundle "tomasr/molokai"
set background=dark
colorscheme jellybeans
"colorscheme tomorrow-night-bright
"colorscheme molokai

function! GlobalColorSettings()  " Set global color settings, regardless of colorscheme currently in use.
    " Set 'TODO' & 'FIXME' strings to be bold and standout as hell.
    highlight Todo term=standout ctermfg=196 ctermbg=226 guifg=#ff4500 guibg=#eeee00

    " TODO: colorscheme jellybeans only.
    "highlight Operator term=underline ctermfg=215 guifg=#ffb964

    " Set cursor color to be like in jellybeans.vim colorscheme, but with black text (previously white).
    "highlight Cursor ctermfg=Black ctermbg=153 guifg=#000000 guibg=#b0d0f0
endfunction

autocmd colorscheme * call GlobalColorSettings()  " Call the global color settings on every colorscheme change.


" Formatting & Text
set encoding=utf-8
set nowrap  " No line wrapping.
set linebreak  " Wrap at word.
set textwidth=0  " Desirable text width. Used for text auto-wrapping. 0 means no auto-wrapping.
autocmd FileType * set formatoptions=r,2  " Enable auto-wrapping comments, comment leader auto-insertion in <Insert> mode, auto-format paragraphs, keep last line indentation. Disable all other format options. NOTE: Requires 'set autoindent'. autocmd FileType is required since formatoptions i set differently for each fiel type (.c, .py, etc.).
set backspace=indent,eol,start  " Enable backspace key. Erase previously entered characters in insert mode.
set number  " Show line numbers.
"set numberwidth=5  " Width of numbers column.
set showmatch  " Show matching brace on insertion or cursor over.
set matchtime=3  " How many tenths of a second to wait before showing matching braces.
set matchpairs+=<:>  " Treat '<','>' as matching braces.
" Invisible characters.
if ! has("win32")
    set listchars=tab:▸\ ,trail:¬,eol:«  " Invisible characters.
    "set listchars=tab:°\ ,trail:·,eol:☠  " Alternative invisible characters.
endif
"set list  " Display invisible characters.
set nolist  " Don't display invisible characters.


" Indentation
set autoindent  " Automatically set the indent of a new line (local to buffer).
set smartindent
"set shiftround  " Round shift actions. i.e. When at 3 spaces, and I hit > ... go to 4, not 5. FIXME: Doesn't work.


" Folding
set foldenable  " Turn on folding.
set foldmethod=marker  " Fold on the marker.
set foldlevel=100  " Don't autofold anything (but I can still fold manually).
set foldopen=block,hor,tag,percent,mark,quickfix  " Which movements open folds.


" Backup
set nobackup  " Disable file backup before file overwrite attempt.
set nowritebackup

"set undofile  " Keep undo actions even when a file (buffer) is closed.
"if has ("win32")  " Set undo files location.
    "set undodir=$HOME\vimfiles\undo
    "set undodir+=C:\tmp
    "set undodir+=C:\temp
    "set undodir+=.
"else
    "set undodir=$HOME/.vim/undo
    "set undodir+=/var/tmp
    "set undodir+=/tmp
    "set undodir+=.
"endif


" Window splitting
"set equalalways  " Multiple windows, when created, are equal in size. NOTE: Doesn't work well with MiniBufExpl.vim
set splitbelow splitright  " New windows are created to the bottom-right.


" Mouse
"Set mouse behaviour to be like the OS's.
if has ("win32")
    behave mswin
else
    behave xterm
endif
set mouse=a  " Enable mouse.
"set mouse-=a  " Disable mouse.
set mousehide  " Hide mouse after chars typed.
behave xterm  " Make mouse behave like in xterm (instead of, e.g. Windows' command-prompt mouse).
set selectmode=mouse  " Enable visule selection with mouse.


" Bells
set novisualbell  " No blinking
"set noerrorbells  " No noise.
"set vb t_vb= " Disable any beeps or flashes on error


" Ignored files
set wildignore+=*.jpg,*.jpeg,*.png,*.gif  " Ignore images
set wildignore+=*.pdf  " Ignore PDF files


" Key mappings
" Map arrow keys to window-change actions.
"map <Up> <C-w>k
"map <Down> <C-w>j
map <Left> <C-w>h
map <Right> <C-w>l
" Map up/down keys to page-up/down.
map <Up> <C-b>
map <Down> <C-f>


" Misc.
let mapleader=","  " Set <leader> key to comma.
set history=256  " Number of things to remember in history.
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay).
"set autoread  " Reload file if changed outside of Vim (DANGEROUS!).
set clipboard+=unnamed  " Enable OS clipboard integration.
set hidden  " The current buffer can be put to the background without writing to disk.
autocmd BufWinEnter * lcd %:p:h  " Sets current-directory of current buffer/file. We avoid using `set autchdir` instead, because it can cause problems with some plugins.
"autocmd bufwritepost .vimrc source $MYVIMRC  " Source .vimrc after saving it.
"set timeoutlen=500  " Set key-combination timeout.
set title  " Show title in app title bar.
set ttyfast  " Fast drawing.
set scrolloff=3  " Number of lines to keep above/below cursor when scrolling.
"set debug=msg  " Show Vim error messages.
