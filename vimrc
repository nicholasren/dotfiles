function! InitJavaScript()
  autocmd FileType javascript set tabstop=2
endfunction

function! InitMarkdown()
  autocmd BufNewFile,BufRead *.md setf markdown
endfunction

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-cucumber'
Bundle 'fugitive.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'koron/nyancat-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Townk/vim-autoclose'
Bundle 'The-NERD-tree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'scala.vim'
Bundle 'Tabular'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'ctrlp.vim'
Bundle 'tpope/vim-markdown'
Bundle 'molokai'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'edsono/vim-matchit'
Bundle 'Yggdroot/indentLine'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

call InitJavaScript()
call InitMarkdown()

" ===============
" look and feel
" ===============
if has("gui_macvim")
    set guifont=consolas:h16
    set relativenumber
    set undofile
endif
set background=dark
colorscheme solarized
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"===================
" mappings
"===================

let mapleader = ","

map <Leader>cu :Tabularize /\|<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>o :call RunCurrentLineInTest()<CR>
map <Leader>t :call RunCurrentTest()<CR>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>n :call RenameFile()<cr>
map <Leader>, :NERDTreeFind<CR>
map <Leader>/  <plug>NERDCommenterToggle<cr>
nmap <leader>a :Ack
map <Leader>h :noh<cr>
map <Leader>d :Dash<cr>
nnoremap <leader>r :w<CR>:! ruby %<CR>
" copy the file path to buffer
map <silent> <Leader>c :let @+ = expand("%")<cr>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" control-j/k/h/l move to the split up/down/left/right
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" auto align cucumber table
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" ruby refactor
map <leader>ap  :RAddParameter<cr>
map <leader>cpc :RConvertPostConditional<cr>
map <leader>el  :RExtractLet<cr>
map <leader>ec  :RExtractConstant<cr>
map <leader>elv :RExtractLocalVariable<cr>
map <leader>it  :RInlineTemp<cr>
map <leader>rl :RRenameLocalVariable<cr>
map <leader>ri :RRenameInstanceVariable<cr>
map <leader>em :RExtractMethod<cr>
map <Leader>dd orequire 'ruby-debug'; debugger<esc>
inoremap jk <esc>

" ============
" settings
" ============
set nocompatible
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500                "keep 500 lines of command line history
set ruler                      "show the cursor position all the time
set showcmd                    "display incomplete commands
set autoindent
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set number
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set tags=./tags; " Set the tag file search order
set grepprg=ack " Use Ack instead of grep
set noesckeys " Get rid of the delay when hitting esc!
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set hlsearch
set list
set listchars=tab:=»,trail:·
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**" " Fuzzy finder: ignore stuff that can't be opened, and generated files
set nofoldenable
set autowriteall

syntax on                 " Enable syntax highlighting
filetype plugin indent on

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500
xnoremap p pgvy


" ctrlp stuff
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window_reversed = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"===============
" auto commands
"===============
if has("autocmd")
  autocmd FileType text setlocal textwidth=78
  autocmd BufNewFile,BufRead *.scala,*.sbt set filetype=scala
  autocmd BufNewFile,BufRead *.gradle,*.groovy set filetype=groovy
  autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
  autocmd bufwritepost .vimrc source  ~/.vimrc
  autocmd FileType ruby,yaml set ai sw=2 sts=2 foldmethod=indent
  " Remove trailing whitespace on save for ruby, scala, coffee files.
  au BufWritePre *.rb,*.scala,*.coffee :%s/\s\+$//e
  au FocusLost * :wa
endif
