"-------------------------------------------------------------------------------
" Basic
"-------------------------------------------------------------------------------
set nocompatible
set noswapfile
let loaded_matchparen=1
syntax on
set number
set showmatch
set nowritebackup
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set pastetoggle=<C-f>
set autoindent
set formatoptions=q

"-------------------------------------------------------------------------------
" StatusLine
"-------------------------------------------------------------------------------
set laststatus=2
set ruler
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P


"-------------------------------------------------------------------------------
" Search
"-------------------------------------------------------------------------------
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildmenu

"-------------------------------------------------------------------------------
" KeyMap
"-------------------------------------------------------------------------------
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"-------------------------------------------------------------------------------
" Color
"-------------------------------------------------------------------------------
set t_Co=256
colorscheme slate

"-------------------------------------------------------------------------------
" Encoding
"-------------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

"-------------------------------------------------------------------------------
" Other
"-------------------------------------------------------------------------------

" auto comment off
autocmd FileType * setlocal formatoptions-=ro

" Highlight 80
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  autocmd FileType sh,vim,ruby,haskell,php setlocal textwidth=80
endif

set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"-------------------------------------------------------------------------------
" neocomplcache
"-------------------------------------------------------------------------------
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

"-------------------------------------------------------------------------------
" Unite
"-------------------------------------------------------------------------------
noremap <C-b><C-f> <C-u>:Unite<Space>file_mru<CR>
noremap <C-b><C-b> <Esc>:UniteWithBufferDir -buffer-name=files file<CR>

"-------------------------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein.vim'))

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/vimshell')
call dein#add('Shougo/neocomplete')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimfiler')
call dein#add('Lokaltog/vim-powerline')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-surround')
call dein#add('mattn/emmet-vim')
call dein#add('mattn/gist-vim')
call dein#add('mattn/webapi-vim')
call dein#add('h1mesuke/unite-outline')
call dein#add('Shougo/vinarise')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('zhaocai/unite-scriptnames')
call dein#add('Align')
call dein#add('thinca/vim-quickrun')
call dein#add('koron/chalice')
call dein#add('violetyk/neocomplete-php.vim')
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/syntastic')        "文法チェック"
call dein#add('scrooloose/nerdtree') "サイドバーの設定"
call dein#add('Xuyuanp/nerdtree-git-plugin') "サイドバーの設定git"
call dein#add('jistr/vim-nerdtree-tabs') "サイドバーの設定git"
call dein#add('ConradIrwin/vim-bracketed-paste')

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call dein#end()
"Syntax Check ---------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_enable_balloons = 1

let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1

au BufRead,BufNewFile *.php set makeprg=php\ -l\ %
au BufRead,BufNewFile *.php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php map <c-c><c-c> :make<cr> :cw<cr><cr>
"----------------------------------------------------


nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=0

set clipboard=unnamed,autoselect

filetype plugin indent on
