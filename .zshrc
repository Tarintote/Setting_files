export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# 補完
autoload -Uz compinit
compinit

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドミスを修正
setopt correct
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

##################
## history setting
##################
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# share the history
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks  

# 古いコマンドと同じものは無視 
setopt hist_save_no_dups
################
# history setting end
################
#
setopt nolistbeep
setopt auto_pushd
setopt auto_cd
setopt noautoremoveslash


# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# git設定
autoload -Uz vcs_info
setopt prompt_subst
PROMPT="%{${fg[black]}%}[%~]$%{${reset_color}%}"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
#PROMPT=$PROMPT'${vcs_info_msg_0_}'
RPROMPT='${vcs_info_msg_0_}'

# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit

##Alisas configuration
setopt complete_aliases
alias where="command -v"
case "$OSTYPE" in
freebsd*|darwin*)
	alias ls="ls -G -w"
	;;
linux*)
	alias ls="ls -- color"
	;;
esac

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* }
