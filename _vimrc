" まずはNeoBundleの設定
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Unite なんか凄い 
NeoBundle 'Shougo/unite.vim'
" vim-easymotion
" NeoBundle 'haya14busa/vim-easymotion'
" smartinput 
" NeoBundle 'kana/vim-smartinput'
" 補完
NeoBundle 'Shougo/neocomplete'
" 非同期実行
NeoBundle 'Shougo/vimproc'
" スニペット補完
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" choosewin
NeoBundle "osyo-manga/unite-choosewin-actions"
" vim でファイラ
NeoBundle 'Shougo/vimfiler.vim'
" vim でシェル
NeoBundle 'Shougo/vimshell'
" indentLine
NeoBundle "Yggdroot/indentLine"
" 実行
NeoBundle 'thinca/vim-quickrun'
" substituteをプレビュー
NeoBundle 'osyo-manga/vim-over'
" 対応カッコをハイライトする?
NeoBundle 'vim-scripts/Highlight-UnMatched-Brackets'
" vimからツイッター
NeoBundle 'TwitVim'
" カラースキーム
NeoBundle 'ujihisa/unite-colorscheme'
" カラースキーム
NeoBundle 'w0ng/vim-hybrid'
" きれいなカラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" ステータスラインが便利になる
NeoBundle 'itchyny/lightline.vim'
" 
NeoBundle 'osyo-manga/unite-quickfix'
" コピペ周りが楽になる
NeoBundle 'YankRing.vim'
" vim から git
NeoBundle 'tpope/vim-fugitive'
" neocompleteから英語辞書の利用
NeoBundle 'https://github.com/ujihisa/neco-look.git'
" ぬるぬる動かす
NeoBundle 'yonchu/accelerated-smooth-scroll'
" 検索結果が見やすくなり助かる
NeoBundle 'osyo-manga/vim-anzu'
"ウィンドウサイズの変更が楽になる
NeoBundle 'git://github.com/jimsei/winresizer.git'
" なんだっけこれ
NeoBundle 'deris/vim-duzzle'
" インサートモード中に色がついてわかりやすくなる 
NeoBundle 'cohama/vim-insert-linenr'
" haskell用
NeoBundle 'ujihisa/neco-ghc'
" haskell用
NeoBundle 'dag/vim2hs'
" Mac内臓の辞書アプリの内容を呼び出す
NeoBundle 'modsound/macdict-vim.git'
" エラー行をチェック'
NeoBundle 'scrooloose/syntastic'

NeoBundleCheck


" history/yankの有効化
let g:unite_source_history_yank_enable =1  
" check the yankring history 
nnoremap <silent> ,gy :<C-u>Unite history/yank<CR>


filetype plugin indent on

" jellybeansの利用
" colorscheme jellybeans
colorscheme ron
" test hoge hoge

" unite-choosewin-actions
" 選択を行わないウィンドウ番号をフィルタリングする関数

" ファイルを開く場合のデフォルトアクションを choosewin にする

let g:quickrun_config = {
\   "_" : {
\       "hook/santi_pinch/santi" : 10,
\       "hook/santi_pinch/keyword" : "warning",
\       "hook/santi_pinch/rate" : 1.0,
\       "hook/santi_pinch/min" : 4,
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 10,
\       "runner/vimproc/sleep" : 10,
\       "outputter" : "multi:buffer:buffered",
\       "outputter/buffered/target" : "null"
\   },
\}


" quickrun の設定
" バッファの開き方を設定
" 一番下に水平分割してウィンドウを開く
" ウィンドウの高さは 8行
let g:quickrun_config = {
\         "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\       "hook/time/enable": 1,
\       "outputter/buffer/split" : ":botright 4sp",
\   }
\}

" ヤンク周りの設定
"
" 200行ヤンク
" '20  - remember marks for 20 previous files
" \"200 - save 200 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"200,:20,%,n~/.viminfo 

" Twitvim 関連 あまり使ってない
let twitvim_count = 40
nnoremap <C-t> :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
  set nowrap
endfunction
syntax on
filetype detect

" バックアップ作成
function! SaveBackup()
 let b:backup_count = exists('b:backup_count') ? b:backup_count+1 : 1
 return writefile(getline(1,'$'), bufname('%') . '_' . b:backup_count)
endfunction
nnoremap  ;b :call SaveBackup ()<cr>

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction



""" unite.vim
"" コピペしただけ まだ何も分かっていない
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q


" smooth-scroll
" <C-d>/<C-u> 時のスリープ時間 (msec) : 小さくするとスクロールが早くなります。
" Default : 10
let g:ac_smooth_scroll_du_sleep_time_msec = 2

" <C-f>/<C-b> 時のスリープ時間 (msec) : 小さくするとスクロールが早くなります。
" Default : 10
let g:ac_smooth_scroll_fb_sleep_time_msec = 2 " <C-d>/<C-u> 時のスリープ時間 (msec) : 小さくするとスクロールが早くなります。
" Default : 10
let g:ac_smooth_scroll_du_sleep_time_msec = 2

" <C-f>/<C-b> 時のスリープ時間 (msec) : 小さくするとスクロールが早くなります。
" Default : 10
let g:ac_smooth_scroll_fb_sleep_time_msec = 2  


" vim-anzu
" 移動後にステータス情報をコマンドラインへと出力を行います。
" statusline を使用したくない場合はこっちを使用して下さい。
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)



" texコマンドを数学的表示してくれる
let g:tex_conceal=""
" set conceallevel=2

" 色々 set

"カーソル位置を目立たせる
" set cursorline
" set cursorcolumn
hi clear CursorLine
nnoremap <esc><esc> :nohlsearch<cr><esc>:set nopaste<cr>

" 検索結果をハイライトする
set hlsearch
" 勝手に改行しない
" set nowrap
" スペルチェッカ
" set spell


" 行番号の表示
set number
" 賢いインデント
set smartindent
" 位置の表示
set ruler
" 文字色
syntax on
" 
set shiftwidth=2
" 
set nocompatible 

" tabをスペースに変換
set smarttab
set expandtab
set tabstop=2
set autoindent
set softtabstop=2

" 右下に入力途中のコマンドを表示しない
set noshowcmd
" モードの表示をしない vim-airlineで十分
set noshowmode
" 対応するカッコの強調表示
set showmatch
" コマンドラインは2行
set cmdheight=2

" backspaceでインデントと行を消せるように 
set backspace=indent,eol,start
" タイトルの表示
set title
" <C-a>と<C-x>などの基数を設定
set nrformats-=octal
" スワップファイルを作らない
set noswapfile
" 
set linebreak
set autoread
set completeopt=menuone


" bellを鳴らさない
set t_vb=
set novisualbell

" バックアップを作らない
set nowritebackup
set nobackup
set backupdir-=.

"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" F2, F3 でバッファの切替
map <F2> <esc>:bp<cr>
map <F3> <esc>:bn<cr>


" 無限 undo 
if has('persistent_undo')
        set undodir=~/.vim/undo
        set undofile
endif

" ファイルを開いたら前回の編集点にカーソルが置かれるように
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""


" paste状態をF4で切り替え
set pastetoggle=<F4>

" 全角スペースを見やすく表示する
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /　/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif


" 矢印の無効化
inoremap OA <Nop>
inoremap OB <Nop>
inoremap OC <Nop>
inoremap OD <Nop>

" カッコ等の入力補助
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap <> <><left>

"
" コピペ用 (Mac用)
vnoremap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nnoremap <Space><C-v> :call setreg("\"",system("pbpaste"))<CR>p


" C-space にESCの割り当て
" keyremap4macbookと合わせて, IMEをオフにする
" inoremap <C-space> <esc>
" vnoremap <C-space> <esc>

" Vimshell
nnoremap <silent> ,is :VimShell<cr>
nnoremap <silent> ,irr :VimShellInteractive R -q <cr>
nnoremap <silent> ,ih  :VimShellInteractive ghci<cr>
vnoremap <silent> ,ss :VimShellSendString<cr>
inoremap <silent> ,ss <esc>:VimShellSendString<cr>
nnoremap <silent> ,ss <S-v>:VimShellSendString<cr>
nnoremap <silent> ,rr ggVG:VimShellSendString<cr>

" neosnippet
" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" 自分用 snippet ファイルの場所
let s:my_snippet = '~/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet


" 移動関連 
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap n nzz
nnoremap N Nzz

" ウィンドウの移動
" ウィンドウを分割して移動する
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" 新しいウィンドウは右に, 下に
set splitbelow
set splitright

" ZZで強制終了...を禁止
nnoremap ZZ <Nop>

" vimrcを開く
nnoremap ,vim :vsplit<cr><C-l>:e! $HOME/_vimrc<cr>

" 色々開けるように
set fileencodings=iso-2022-jp,euc-jp,cp932,ucs-bom,utf-8,default,latin1
" 保存しなくても他のファイルを開けるようになる
set hidden

" neocompleteの設定
" よくわからん
let g:acp_enabeAtStartup=0
" 起動
let g:neocomplete#enable_at_startup = 1

let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#enable_auto_close_preview=0


" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> pumvisible() ? neocomplete#close_popup() :"<esc>$i"
" C-e で補完のキャンセル
inoremap <expr><C-e>  pumvisible() ? neocomplete#cancel_popup() :""

" 補完候補を20個表示
"
let g:unite_cursor_line_highlight = 'Search'
let g:unite_abbr_highlight = 'StatusLine'

" quickrunの設定
let g:quickrun_config ={}

" quickrun の出力をUTF-8に指定
let g:quickrun_config['vim'] = { 
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "utf-8",
\}

" 理系だから全角句読点は使わない 
autocmd FileType tex nnoremap \cor :%s/。/. /g <cr>:%s/、/, /g<cr>

" 移動周りの設定
inoremap <C-d> <del>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
" C-gで補完のキャンセル
inoremap <expr><C-g> neocomplete#undo_completion()
nmap <C-g> <Plug>(caw:I:toggle)
vmap <C-g> <Plug>(caw:I:toggle)

" vim-anzu関連
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
augroup vim-anzu
" 一定時間キー入力がないと
" ウインドウを移動したとき、タブを移動したときに
" 検索ヒット数の表示を消去する
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END

