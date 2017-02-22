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