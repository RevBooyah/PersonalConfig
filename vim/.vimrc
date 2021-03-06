
set nocompatible              " be iMproved, required
filetype off                  " required

" before running the first time, install Vundle with:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'alessandroyorba/despacio'
Plugin 'ervandew/supertab'
Plugin 'powerline/powerline'
Bundle 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'vim-scripts/Better-CSS-Syntax-for-Vim'
"Plugin 'vim-scripts/taglist.vim'
" This causes weird "q" characters in securecrt terminal
"Plugin 'vim-scripts/Terminus'
Plugin 'brauner/vimtux'
Plugin 'godlygeek/csapprox'  " add ability to handle gui colorscheme in terminal
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tmhedberg/matchit'
Plugin 'mileszs/ack.vim'
Plugin 'arecarn/selection.vim'
" This is a badass plugin to do math for you. Thanks Ryan Carney!
"Plugin 'arecarn/chunch.vim'
"Plugin 'arecarn/Frisk.vim'   " :Frisk <searchterm> opens search results in browser.
"Plugin 'arecarn/auto-autoread.vim'
" Use gb and gB to switch/wrap between buffers.
"Plugin 'arecarn/go-to-buffer.vim'

"fuzzy Finder
"Plugin 'eparreno/vim-l9'
"Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'dracula/vim'
"Plugin 'ctrlpvim/ctrlp.vim'

" Only works in terminals with good color support
"Plugin 'ap/vim-css-color'

" For snipmate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'yegappan/mru'

"Fun Stuff
"Plugin 'joshhartigan/vim-reddit'
"Plugin 'ryanss/vim-hackernews'
"Plugin 'vim-scripts/matrix.vim--Yang'

" Various plugins I usually don't use, but may...
"Bundle 'joonty/vim-phpqa.git'
"Bundle 'tobyS/pdv'
"Plugin 'tobyS/vmustache'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'valloric/YouCompleteMe'
"Plugin 'ervandew/screen'
"Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'spf13/piv'
"Plugin 'vim-scripts/Vim-R-plugin'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/unite.vim'
"Bundle 'm2mdas/phpcomplete-extended'
"Plugin 'arecarn/binascii.vim'






"     Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" function: TabMerge could be installed
" http://www.vim.org/scripts/script.php?script_id=1961
" :Tabmerge [tab number] [top|bottom|left|right]

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" For PHP Documenter (pdv)
"let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

let g:airline_powerline_fonts = 1

function! AirlineThemePatch(palette)
      let a:palette.accents.bold_yellow = [ '#ffffff', '', 0, '', 'bold' ]
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'

"let g:Powerline_symbols         = "fancy"
"let g:airline_theme             = 'powerlineish'
"let g:airline_theme             = 'wikipedia'
"let g:airline_theme             = 'wombat'
"let g:airline_theme             = 'sol'
"let g:airline_theme             = 'hybrid'
"let g:airline_theme             = 'solarizedlight'

let g:airline#extensions#tabline#enabled = 1 " automatically displays all buffers when there's only one tab open
"let g:airline#extensions#tabline#left_sep = ' '            " straight separators
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1

set noshowmode

":X to encrypt the file
set cm=blowfish

" For ultisnips plugin
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" for phpcomplete-extended
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

" For NERDTree  (to startup automatically when no files are selected)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" to open NERDTree with CTRL-N
map <C-n> :NERDTreeToggle<CR>
"map <C-g> :NERDTreeToggle<CR>
" Auto close nerdtree if it's the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1

" Command line wild modes
set wildmode=full
set wildmenu
set wildcharm=<TAB>

" File Searching
" ignored files
set wildignore=*.o,*.obj,*.pyc,*.DS_Store,*.out,HEAD,*.lst,*.i,*.map,tags*,cscope.out
" lower priority files suffixes
set suffixes=.bak,~,.o,.info,.swp,.obj,.git,.hg,.svn

set path=
set path+=.  " To search relative to the directory of the current file
set path+=,, " To search in the current directory
set path+=** " Relative to the current directory search recursively




" show open buffers and lets you select one
:nnoremap <F5> :buffers<CR>:buffer<Space>


" delimitMate Settings;
" https://github.com/Raimondi/delimitMate
let delimitMate_expand_cr = 1
filetype indent plugin on


" Taglist settings
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Use_Right_Window=1
"nmap <leader>g :TlistToggle<CR>
nnoremap <leader>g :TlistToggle<CR>


" This allows full background colors in tmux
set t_ut=

"turn off visual bell
set vb t_vb=

" Allows you to have multiple buffers open
set hidden
" Lines of code will not wrap to the next line
"set nowrap
" Make backspace behave like other editors
set backspace=indent,eol,start
" Show line numbers.
set number

" Set 8 lines to the cursor.
set so=7
" show position always
set ruler
"set cmdheight=2
set lazyredraw

"set modelines " security related - I don't have anything that uses modelines
set encoding=utf-8
"set autowrite
set autoread

"let mapleader = ","
let g:mapleader = "\<Space>"

" easier buffer alternate
nnoremap <Backspace>  <C-^>

"colorscheme ir_black
"colorscheme wombat256mod
"
"colorscheme facebook
"colorscheme wikipedia
"colorscheme sol-term
"colorscheme wombat256i
"colorscheme wombat_scc
let g:despacio_Twilight = 1 "dark, but not too dark. Campfire is good too
colorscheme despacio
" Automatically indent on new lines
set autoindent
"set ai
"set si

"nnoremap / /\v
"vnoremap / /\v

" remap to find matching with tabs
nnoremap <tab> %
vnoremap <tab> %

" Depending on keyboard, this fixes an annoying problem
" who needs help anyway...
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

imap jj <ESC>
imap kkk <ESC>

" use s/S for single char inserts. Which I do a LOT more than line Subst
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
" There is a function to allow <#>s repeat, but I don't want it :)

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>
endif

"FuzzyFinder Shortcuts
nmap <leader>f :FufFile **/<CR>
nmap <leader>z :FufFileWithCurrentBufferDir<CR>
nmap <leader>b :FufBuffer<CR>
nmap <leader>T :FufTaggedFile<CR>

" Shifting whole lines with tab.
vmap <Tab> >gv
vmap <S-Tab> <gv

" double tap space (leader) to insert a single character
nmap <silent> <leader><space> "=nr2char(getchar())<cr>P


" Copy the indentation of the previous line if auto indent doesn't know what to do
set copyindent
" Indenting a line with >> or << will indent or un-indent by 4
set shiftwidth=4
" Pressing tab in insert mode will use 4 spaces
set softtabstop=4
" Use spaces instead of tabs
set expandtab
" Highlight matching braces/tags
set showmatch
" Ignore case when searching
set ignorecase
" ...unless there's a capital letter in the query
set smartcase
" Indent to correct location with tab
set smarttab
" Highlight search matches
set hlsearch
" Search while you enter the query, not after
set incsearch
" More undos
set undolevels=1000
" Vim can set the title of the terminal window
set title
" Use a visual indicator instead of a beep
set visualbell
" Or just turn error bells off with this
set noerrorbells

set history=1000
set autoread
set mouse=a
set lbr
set si
syn sync fromstart
" Enable syntax highlighting
syntax enable
" Tell vim that your terminal supports 256 colors
set t_Co=256
set term=xterm-256color
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" So you can paste without autotabs. F2 to toggle on and off
set pastetoggle=<F2>
nmap \o :set paste!<CR>

"to allow full color backgrounds in tmux
set t_ut=

"turns on the background for the current line
set cursorline

set ttyfast

" Smart way to move between windows - opted for word movements with ctrl
" Note - ctrl-l overwrite requires :redraw or just do it in insert mode
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-h> <C-W>h
"nnoremap <C-l> <C-W>l
" I found this really handy and saves finger stretching for other chords.
nnoremap <C-j> }
nnoremap <C-k> {
nnoremap <C-h> b
nnoremap <C-l> w


" faster than typeing make
map <f9> :make
set makeprg=make
"  debug help=>   :copen, :cclose, :cw

" Moving with wrapped lines more sane:
nmap j gj
nmap k gk

" emacs-y type movements - from a mispent youth living in emacs
:cnoremap <C-a>  <Home>
":cnoremap <C-b>  <Left>
":cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
":cnoremap <M-b>  <S-Left>
":cnoremap <M-f>  <S-Right>
":cnoremap <M-d>  <S-right><Delete>
":cnoremap <Esc>b <S-Left>
":cnoremap <Esc>f <S-Right>
":cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" Switching between buffers in a much easier way.  Instead of <C-Shift-6>
:nmap <C-e> :e#<CR>

" These are the buffer switchers I use. I don't recommend them to anyone. They
" match MY habits
:nmap <C-o> :bnext<CR>
:nmap <C-p> :bprev<CR>



" Easy PHP testing
map <C-M> :w!<CR>:!/usr/bin/php -l %<CR>
" Execute PHP - doesn't check filetype!
map <C-m> :w!<CR>:!/usr/bin/php %<CR>

" Use ; instead of : to enter commands, saves a lot of keystrokes in the long run
nnoremap ; :

" Set the 99'th column to a color if the line is too long.
highlight ColorColumn ctermbg=DarkGray
call matchadd('ColorColumn', '\%99v', 100)


filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP


"Remap ctrl-x ctrl-o TO:  ctrl-<space>  To match eclipse/visual-studio
inoremap <C-@> <C-x><C-o>
"inoremap <C-@> <C-Space>
"  also could use: inoremap <C-space> <C-x><C-o> and then do inoremap <C-@> <c-space>
"  Depends on GUI or not.

" Bubble single linec
" NOTE - this doesn't work on mac...
nnoremap <silent> <C-Up>   :move-2<CR>==
nnoremap <silent> <C-Down> :move+<CR>==
xnoremap <silent> <C-Up>   :move-2<CR>gv=gv
xnoremap <silent> <C-Down> :move'>+<CR>gv=gv

"Duplicate lines above and below (again - no mac)
inoremap <C-A-down> <esc>Ypk
nnoremap <C-A-down> Ypk
xnoremap <C-A-down> y`>pgv
inoremap <C-A-up> <esc>YPj
nnoremap <C-A-up> YPj
xnoremap <C-A-up> y`<Pgv


" adding a space above with shift-enter and below with enter
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

map ff ggVG=  " re-indent the entire file.

" ft = fold tag (in HTML)
nnoremap <leader>F Vatzf

" strip all trailing whitespace from the file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" HARD REWRAP - useful for text writing of paragraphs
"nnoremap <leader>q gqip

" yanking and pasting single words. P is to reuse the buffer
nnoremap <leader>y yiw
nnoremap <leader>p viwp
xnoremap <leader>P "_dP
"nnoremap <leader>P viw"0p

" Putting quotes around single words (with . repeat working)
":nnoremap <Leader>q" ciw"<Esc>P
":nnoremap <Leader>q' ciw'<Esc>P
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P'"
:nnoremap <Leader>q' ciw'<C-r><C-o>"'<Esc>
:nnoremap <Leader>q" ciw"<C-r><C-o>""<Esc>


" Open a split window (vertically)
nnoremap <leader>w <C-w>v<C-w>l

" open a split horizontally
nnoremap <leader>h <C-w>s<C-w>l

" go to start/end of current line
noremap H ^
noremap L g_

" Some emaces habits die hard :)
inoremap <c-a> <esc>I
noremap <c-a> 0
inoremap <c-e> <esc>A
noremap <c-e> $
"inoremap <c-k> <esc>d$
" noremap <c-k> <esc>d$  " I have this for switching split


" tabs stuff
nnoremap <leader>t :tabnew<CR>
"nnoremap <leader>q :tabclose<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>
"nnoremap <C-S-t>     :tabclose<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-q> <Esc>:tabclose<CR>
"inoremap <C-S-t>     <Esc>:tabclose<CR>

nnoremap < :tabp<CR>
" instead of/or with: gt
nnoremap > :tabn<CR>
" instead of/or with:  gT
" Might change ,, to be :wq
let notabs = 0
nnoremap <silent> <F7> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

" Semantic Highlighting. :SemanticHighlight or :SemanticHighlightRevert
:nnoremap <leader>h :SemanticHighlightToggle<cr>

" " make these commonly mistyped commands still work:
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" These only work in gvim
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>


" ,/ will open a quickfix window to show matches of last search buffer
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" ,? will search the directory for any matches of the last search. BOOM. This rocks.
nnoremap <silent> <leader>? :execute "Ack! '" .  substitute(substitute(substitute(@/, "\\\\<", "\\\\b",""),"\\\\>","\\\\b",""),"\\\\v","","")."'"<CR>


" Visual mode search (based on scrooloose's blog post)
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>


" Status bar stuff
set laststatus=2
"set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
"set rulerformat=%15(%c%V\ %p%%%)
"set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}

"fun! FileTime()
  "let ext=tolower(expand("%:e"))
  "let fname=tolower(expand('%<'))
  "let filename=fname . '.' . ext
  "let msg=""
  "let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
  "return msg
"endf
"
"fun! CurTime()
  "let ftime=""
  "let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  "return ftime
"endf


let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.']}

let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
"
" Quickly open .vimrc in a split window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>
function! HLNext (blinktime)
        highlight WhiteOnRed ctermfg=white ctermbg=red
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#\%('.@/.'\)'
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
endfunction


if exists("&undodir")
    set undofile          "Persistent undo! Pure money.
    let &undodir=&directory
    set undolevels=1000
    set undoreload=1000
endif



" Cold folding OFF by default for php
let g:DisableAutoPHPFolding = 1
"setlocal foldmethod=manual
"EnableFastPHPFolds

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" ignore stupid files 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|vendor)$'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
