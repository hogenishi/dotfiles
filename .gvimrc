set number		" 行番号を表示する
set ruler		" ルーラーを表示する
set cursorline		" カーソル行の背景色を変える
set cursorcolumn	" カーソル位置のカラムの背景色を変える
set laststatus=2	" ステータス行を常に表示
set cmdheight=2		" メッセージ表示欄を2行確保
set showmatch		" 対応する括弧を強調表示
set helpheight=999	" ヘルプを画面いっぱいに開く
set list		" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲ " 不可視文字の表記記号指定
set lines=60		" 列
set columns=180		" 行
set guifont=Ricty:h10	" フォントのスタイル、サイズ
set transparency=5	" 背景の透明度
set ignorecase		" 大文字小文字を区別しない
set smartcase		" 検索文字に大文字がある場合は大文字小文字を区別
set incsearch		" インクリメンタルサーチ
set hlsearch		" 検索マッチテキストをハイライト
set virtualedit=all	" カーソルを文字が存在しない部分でも動けるようにする
set nowritebackup	" バックアップつくらない
set nobackup		" バックアップをつくらない
set noswapfile		" スワップファイルを作成しない
set novisualbell	" スクリーンベルの無効化
set tabstop=4		" タブの画面用での幅
set expandtab		" タブをスペースに展開
set cindent		" オートインデント
set shiftwidth=4	" オートインデントの深さ
set backspace=indent,eol,start " バックスペースでインデントや改行を削除
set hlsearch		" 検索結果をハイライト
set showmatch		" 括弧入力時に対応する括弧を表示
set incsearch		" インクリメンタルサーチ
set ignorecase		" 検索時に大文字小文字を無視
set wrapscan		" 検索時にファイルの最後まで行ったら最初へ
set antialias		" アンチエイリアス有効
set guioptions-=r	" 右スクロールバー非表示
set guioptions-=R
set guioptions-=l	" 左スクロールバー非表示
set guioptions-=L

colorscheme monokai	" カラースキーム

" フルスクリーンモード
if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

