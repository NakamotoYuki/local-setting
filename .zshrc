bindkey -v

autoload -U compinit; compinit

autoload -Uz colors
colors

PROMPT="%{${fg_bold[blue]}%}%n@%m %T%{${reset_color}%}$ "
PROMPT2="%{${fg_bold[blue]}%}%n@%m%{${reset_color}%}$ "

RPROMPT="[%{${fg[green]}%}%~%{${reset_color}%}]"

setopt transient_rprompt
setopt prompt_subst

bindkey '^U' backward-kill-line

export LANG=en_US.UTF-8

autoload -U compinit
compinit -u

setopt autopushd
setopt pushd_ignore_dups

setopt auto_cd
setopt list_packed
setopt list_types
setopt no_beep

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt EXTENDED_HISTORY

setopt ignoreeof

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

alias ls="ls -G"
# alias ls="ls --color"

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# gitcompletion
# autoload bashcompinit
# bashcompinit
# source ~/.git-completion.sh

alias dos2unix='fromdos'
alias unix2dos='todos'

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PM2_KILL_TIMEOUT=60000

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500 # cdrの履歴を保存する個数
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# nvm設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# java設定
export JAVA_HOME="$(/usr/libexec/java_home -v 9.0.4)"

# added by Anaconda3 5.0.1 installer
export PATH="/Users/nkmt/anaconda3/bin:$PATH"

 # usr/localへpathを通すbrewでインストールしたコマンドを使うため
export PATH=/usr/local/bin:$PATH
