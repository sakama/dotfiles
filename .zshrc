# PROMPT
PS1="[@${HOST%%.*} %1~]%(!.#.$) " 
# 便利なプロント
setopt prompt_subst
# emacsライクなキーバインド
bindkey -e

#日本語環境
export LANG=ja_JP.UTF-8
# エディタはemacs
#export EDITOR=emacs

# 強力な補完機能
autoload -U compinit
# このあたりを使わないとzsh使ってる意味なし
compinit -u
# cdの履歴を表示
setopt autopushd
# 同ディレクトリを履歴に追加しない
setopt pushd_ignore_dups
# ディレクトリ名だけで、ディレクトリの移動をする
setopt auto_cd
# cd をしたときにlsを実行する
function chpwd() { ls }
# リストを詰めて表示
setopt list_packed
# 補完一覧ファイル種別表示
setopt list_types
# ビープ音を鳴らさないようにする
setopt no_beep

# 履歴
# historyファイル
HISTFILE=~/.zsh_history
# ファイルサイズ
HISTSIZE=10000
# saveする量
SAVEHIST=10000
# 重複を記録しない
setopt hist_ignore_dups
# スペース排除
setopt hist_reduce_blanks
# 履歴ファイルを共有
setopt share_history
# zshの開始終了を記録
setopt EXTENDED_HISTORY


# history 操作まわり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
alias r="rails"
alias py="python"
alias g="git"
alias ls="ls -G"
alias ll="ls -l"

#配下の.svnファイルを一括削除
function rm-svn(){
   rm -rf `find ./ -type d -name .svn ! -regex \.svn/. -print`
}

#RFCを読む
function rfc(){
    command wget -q -O- http://www.ietf.org/rfc/rfc$2.txt | lv
}

#環境毎の設定を読み込み
#~/.zshenvというファイルに記述する

#zsh-completionsの読み込み
fpath=(~/dotfiles/zsh/zsh-completions $fpath)
#zawの読み込み
source ~/dotfiles/zsh/zaw/zaw.zsh
zstyle ':filter-select' case-insensitive yes # 絞り込みをcase-insensitiveに
bindkey '^@' zaw-cdr # zaw-cdrをbindkey
