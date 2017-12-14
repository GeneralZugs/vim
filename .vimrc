".vimrc by GeneralZugs (stock Vim, no plugins)

set shell=$SHELL "set the shell

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
iab <expr> ctime strftime('%H:%M:%S')
iab <expr> cdt strftime('%H:%M:%S %d.%m.%Y.')
iab <expr> cdate strftime('%d.%m.%Y.')
iab <expr> fdate strftime('%c')


"alias for tabedit (open file in new tab) - usage: :to filename
cnoreabbrev to tabedit

"Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q
map <F5> :w<cr>
map <F9> :wq!<cr>
map <F12> :q!<cr>


"Common stuff
set nocompatible "not compatible with vi
set autoread "detect when a file is changed
set backspace=indent,eol,start "make backspace behave in a sane manner
let mapleader = ',' "change mapleader
let g:mapleader = ','
set history=1000 "change history
set undolevels=1000
set so=7 "scroll offset - set number of lines always visible above and below the cursor
set wildmenu "enhanced command line completion
set wildmode=list:full "complete files like a shell
set wildignore=*.swp,*.bak,*.pyc,*.class "ignore these files when listing
set hidden "current buffer can be put into background
set showcmd "show incomplete commands
set noshowmode "don't show which mode disabled for PowerLine
set cmdheight=1 "command bar height
set title "set terminal title to fileneme being edited
set printoptions=paper:a4 "options for printing
set viminfo='0,:0,<0,@0,f0 "do not save anything to .viminfo file
set ttyfast "set terminal speed
set encoding=utf8 "set default encoding

"Tab control
set expandtab "insert spaces rather than tabs for <Tab>
set smarttab "tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 "the visible width of tabs
set softtabstop=4 "edit as if the tabs are 4 characters wide
set shiftwidth=4 "number of spaces to use for indent and unindent
set shiftround "round indent to a multiple of 'shiftwidth'

"Searching
set ignorecase "case insensitive searching
set smartcase "case-sensitive if expresson contains a capital letter
set hlsearch "highlight search
set incsearch "set incremental search, like modern browsers
set nolazyredraw "don't redraw while executing macros
set magic "set magic on, for regex
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' "highlight conflicts
"toggle hlsearch
noremap <space> :set hlsearch! hlsearch?<cr>
" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

"Syntax settings
filetype off
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete
syntax on "switch syntax highlighting on
set showmatch "show matching braces

"code folding settings
set foldmethod=syntax "fold based on indent
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable "don't fold by default
set foldlevel=1

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
noremap <silent> <F7> :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <F8> :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"disable error bells
set noerrorbells
set visualbell
set t_vb=
""set tm=500 "timeoutlen - time in ms for key combinations to complete

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"Visuals
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme slate

"when both set, vim uses 'hybrid' mode (vim version >=7.4 needed)
set relativenumber " show relative line numbers
set number " show the current line number"

set wrap "turn on line wrapping
set wrapmargin=0 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
" set showbreak=… " show ellipsis at breaking

"" set tw=79   " textwidth - width of document (used by gd)
set textwidth=0
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


set autoindent " automatically set indent of new line
set smartindent
set cindent
set copyindent

set nobackup
set nowritebackup
set noswapfile

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"Toggle paste mode
""map <leader>v :set paste!<cr>
set pastetoggle=<F2>
set clipboard=unnamed

"Disable arrow keys
""noremap <Up> <NOP>
""noremap <Down> <NOP>
""noremap <Left> <NOP>
""noremap <Right> <NOP>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks (better indentation)
" Try to go into visual mode (v), then select several lines of code here and
" then press '>' several times.

vnoremap < <gv
vnoremap > >gv

"Mouse
if has('mouse')
    set mouse=a
    set ttymouse=xterm
endif

"Statusline
"
"%t - tail of the filename
"[%{strlen(&fenc)?&fenc:'none'}, - file encoding
"%{&ff}] - file format
"%h - help file flag
"%m - modified flag
"%r - read only flag
"%y - filetype
"%= - left/right separator
"%c, - cursor column
"%l/%L - cursor line/total lines
"%B - hexvalue of character under cursor
"\ %P - percent through file

let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '^V' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    if (mode() =~# '\v(n|no)')
        exe 'hi! StatusLine ctermfg=002'
    elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
        exe 'hi! StatusLine ctermfg=003'
    elseif (mode() ==# 'i')
        exe 'hi! StatusLine ctermfg=001'
    else
        exe 'hi! StatusLine ctermfg=007'
    endif
    return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
endfunction


set laststatus=2 " show the satus line all the time
""set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ [hex:%B]\ %P
""set ruler "show row and column of the cursor position (not needed if statusline is set)

set statusline=
set statusline+=%{ChangeStatuslineColor()}              " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}  " Current mode
set statusline+=%{&paste?'(paste)':'\'}                 " Paste mode
set statusline+=%*\ [%n]                                " buffer number
set statusline+=%*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%*\ %=                                  " Space
set statusline+=%*\ %y                                  " FileType
set statusline+=%*\ %{(&fenc!=''?&fenc:&enc)}\ [%{&ff}] " Encoding & Fileformat
set statusline+=%*\ \#\ [dec:%b,hex:%B]\ %c,%l/%L\ [%p%%]      " Hexvalue/Column,Rownumber/total (%)
set statusline+=%*\ %-3(%{FileSize()}%)                 " File size


"Other functions and mappings

"Show visual width limit
highlight ColorColumn ctermbg=77

function! ToggleWidthLine()
    if &colorcolumn ==# "80" 
        set colorcolumn=120
    elseif &colorcolumn ==# "120"
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunction

noremap <silent> w :call ToggleWidthLine()<cr>

"Toggle current line and/or column

function! ToggleLineHighlight()
    set cursorline!
endfunction

function! ToggleColumnHighlight()
    set cursorcolumn!
endfunction

noremap <silent> ,hl :call ToggleLineHighlight()<cr>
noremap <silent> ,hc :call ToggleColumnHighlight()<cr>

noremap <silent> ,hh :call ToggleLineHighlight()<cr> :call ToggleColumnHighlight()<cr>

"Execute current file
nmap <leader>, :!%:p<cr>

"Unescape html characters
function! HtmlUnEscape()
    silent s/&lt;/</eg
    silent s/&gt;/>/eg
    silent s/&amp;/\&/eg
endfunction

nnoremap <silent> <leader>u :call HtmlUnEscape()<cr>


"Croatian language only
function! ZamjeniDijakritike()
    %s/Č/C/geI
    %s/Ć/C/geI
    %s/Đ/Dj/geI
    %s/Š/S/geI
    %s/Ž/Z/geI
    %s/č/c/geI
    %s/ć/c/geI
    %s/đ/dj/geI
    %s/š/s/geI
    %s/ž/z/geI
endfunction

map <F3> :call ZamjeniDijakritike()<cr>


function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

map <F4> :call TrimWhiteSpace()<cr>


"When using django with apache, instead of reseting apache every
"time, all we need is to touch wsgi.py after editing

""function! TouchWsgipy()
""    !touch /path/to/wsgi.py
""endfunction

"call the function
""map zz :call TouchWsgipy()<cr>:w<cr>
""cnoreabbr ww :call TouchWsgipy()<cr>:w<cr> "alias for function call
