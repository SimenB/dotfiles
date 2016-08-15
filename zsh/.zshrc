# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

source $HOME/.local.zshrc
source $HOME/.zshalias

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git z sudo brew npm mvn tmux zsh-syntax-highlighting history-substring-search docker kubectl osx)

# Automatically start a tmux session on login
ZSH_TMUX_AUTOSTART="true"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Setup zsh-autosuggestions
[ -s $HOME/.zsh-autosuggestions/autosuggestions.zsh ] && source $HOME/.zsh-autosuggestions/autosuggestions.zsh

export NVM_DIR=~/.nvm

if [ "$(uname)" = "Darwin" ]; then
  function nvm() {
    source $(brew --prefix nvm)/nvm.sh
    nvm "$@"
  }
  export CHROME_BIN="/usr/local/Caskroom/google-chrome/latest/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
  function nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
  }
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
  # Do something under Windows NT platform
fi

function npm() {
  nvm --version > /dev/null 2>&1
  unset -f npm
  npm "$@"
}
# If a space is added before the command, don't add it to history
# Useful if you enter your password in a command
setopt HIST_IGNORE_SPACE

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
