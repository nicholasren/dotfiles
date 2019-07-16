" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'koron/nyancat-vim'
Plugin 'itchyny/lightline.vim'

Plugin 'Townk/vim-autoclose'
Plugin 'The-NERD-tree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-markdown'
Plugin 'molokai'
Plugin 'Yggdroot/indentLine'
Plugin 'rizzatti/funcoo.vim'
Plugin 'honza/vim-snippets'
Plugin 'elzr/vim-json'
Plugin 'airblade/vim-gitgutter'

" file finder
Plugin 'ctrlpvim/ctrlp.vim'

"vim-syntastic
"auto-format
"thinca/vim-quickrun
"junegunn/vim-easy-align
"t9md/vim-quickhl


" ===============
" look and feel
" ===============
set number
colorscheme solarized
set background=light
if has("gui_macvim")
    set guifont=Monaco:h16
    set undofile
    set undodir=~/.vimundo
endif

"===================
" mappings
"===================

let mapleader = ","

map <Leader>gs :Gstatus<CR>
map <Leader>f :Files<CR>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vs :source ~/.vimrc<CR>
map <Leader>, :NERDTreeFind<CR>
map <Leader>/  <plug>NERDCommenterToggle<cr>
nmap <leader>a :Ack
map <Leader>h :noh<cr>
nnoremap <leader>r :w<CR>:! ruby %<CR>
" copy the file path to buffer
map <silent> <Leader>c :let @+ = expand("%")<cr>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

map <Leader>w vi"

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

" resize window
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" ============
" settings
" ============
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
  autocmd FileType ruby,yaml set ai sw=2 sts=2 foldmethod=indent
  " Remove trailing whitespace on save for ruby, scala, coffee files.
  au BufWritePre *.rb,*.scala,*.java :%s/\s\+$//e
  au FocusLost * :wa
  au FileType puppet setlocal isk+=:
endif
