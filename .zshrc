# --------------------------------------------------------------------------
# zsh settings
# --------------------------------------------------------------------------
export LANG=ja_JP.UTF-8
# 自動補完を有効にする
autoload -U compinit; compinit;
# 入力したコマンドが存在せず、かつディレクトリと一致するなら自動でcdする
setopt auto_cd
# cd した先のディレクトリスタックに追加する
setopt auto_pushd
# <Tab> で補完候補を順に表示
setopt auto_menu
# 補完候補一覧でファイルの種別を識別マーク表示
setopt list_types
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups
# コマンド訂正
setopt correct
# 補完候補を詰めて表示
setopt list_packed
# ビープ音ならないように
setopt nolistbeep
setopt no_beep
# コマンドライン引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# グロブ機能の拡張
setopt extended_glob
# カーソル位置で補完
setopt complete_in_word
# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# Ex: <Space>echo hello
setopt hist_ignore_space

# Emacsバインド
bindkey -e
# 処理時間の表示
REPORTTIME=1

#----------------------------------------
# completion style
#----------------------------------------

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
zstyle ':completion:*:default' menu select


alias ls="ls -G"
