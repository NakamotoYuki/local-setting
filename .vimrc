"-------------------------------------------------------------------------------
" Basic
"-------------------------------------------------------------------------------
set nocompatible
set nobackup
set noswapfile
set autoread
let loaded_matchparen=1
syntax on
set number
set showmatch
set nowritebackup
set backspace=indent,eol,start
set tabstop=4
set expandtab
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
set listchars=tab:>-,trail:.

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

" leader key の変更
let mapleader=","
set timeout timeoutlen=1500

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen

" grep の書式を挿入
nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap ,g :Ag<SPACE> :cw<CR>

"削除キーでヤンクさせない"
nnoremap x "_x
"nnoremap d "_d
nnoremap D "_D

"vimタイトルの非表示化"
set notitle

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

"　補完系の設定
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
autocmd FileType html,js :set dictionary=~/.vim/dict/jquery.dict

autocmd FileType javascript set omnifunc=tern#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("/usr/local/bin/rsense")
let g:rsenseUseOmniFunc = 1

set completeopt-=preview
"-------------------------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein.vim/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.vim/dein.vim')
let s:toml_dir = expand('~/.config/nvim')

"dein プラグインインストール
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

   "Load TOML
    let s:toml = s:toml_dir . '/dein.toml'
    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

   "finalize
    call dein#end()
    call dein#save_state()
endif

"Syntax Check ---------------------------------------
"jsのシンタックスチェック
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_balloons = 1

"rubyのシンタックスチェック
let g:syntastic_ruby_checkers = ['rubocop']

"phpのシンタックスチェック
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

nnoremap ; :NERDTreeToggle<CR>

filetype plugin indent on

"検索ハイライトの設定
nnoremap <ESC><ESC> :nohl<CR>

set mouse=a
set clipboard+=unnamed
set clipboard+=autoselect

let g:ctrlp_user_command = 'ag %s -l'

" syntasticキーバインド
nnoremap se :SyntasticCheck<CR>
nnoremap sl :lclose<CR>

" コピー設定
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
