# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="agnoster"

# Make sure to just correct commands, not arguments
# http://superuser.com/a/610025/365668
ENABLE_CORRECTION="false"
unsetopt correct_all
setopt correct

COMPLETION_WAITING_DOTS="true"
# disable adding yarn globals to $PATH
zstyle ':omz:plugins:yarn' global-path false

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-auto-fetch sudo brew npm yarn tmux docker kubectl fnm zsh-completions alias-tips rust ripgrep rbenv rails gh)

# Automatically start a tmux session on login, unless it's from a JetBrains IDE
if [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" && "$TERM_PROGRAM" != "Jetbrains.Fleet" ]]; then
   ZSH_TMUX_AUTOSTART=true
fi

. $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

. $HOME/.zshalias
[ -s $HOME/.local.zshrc ] && . $HOME/.local.zshrc

fpath=(~/.zsh/completion $fpath)

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[ -s $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && . $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -s $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && . $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -s $HOME/.zsh-history-substring-search/zsh-history-substring-search.zsh ] && . $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting

if [ "$(uname)" = "Darwin" ]; then
  # Not needed for now
  # export CHROME_BIN="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
  # Do something on Linux
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
  # Do something under Windows NT platform
fi

# If a space is added before the command, don't add it to history
# Useful if you enter your password in a command
setopt HIST_IGNORE_SPACE

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

[ -f $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ] && . $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
[ -f $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ] && . $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# Override `-R` from oh-my-zsh
export LESS="-FRX"

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

eval "$(mcfly init zsh)"

eval "$(fnm env --corepack-enabled)"

EAS_AC_ZSH_SETUP_PATH=/Users/simen/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH; # eas autocomplete setup

[ -f $HOME/.docker/init-zsh.sh ] && source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
