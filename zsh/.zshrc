# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

# Make sure to just correct commands, not arguments
# http://superuser.com/a/610025/365668
ENABLE_CORRECTION="false"
unsetopt correct_all
setopt correct

COMPLETION_WAITING_DOTS="true"
export NVM_DIR=~/.nvm
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git z sudo brew npm yarn tmux docker kubectl zsh-nvm zsh-completions kubectl alias-tips)

# Automatically start a tmux session on login
ZSH_TMUX_AUTOSTART="true"

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

# Override `-R` from oh-my-zsh
export LESS="-FRX"

test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && . $HOME/.travis/travis.sh

# expo development
[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ] && . $HOME/.nix-profile/etc/profile.d/nix.sh
