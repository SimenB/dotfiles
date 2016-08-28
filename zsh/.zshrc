# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

source $HOME/.zshalias
[ -s $HOME/.local.zshrc ] && source $HOME/.local.zshrc

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
export NVM_LAZY_LOAD=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git z sudo brew npm mvn tmux docker kubectl osx zsh-nvm zsh-completions)

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

[ -s $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -s $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -s $HOME/.zsh-history-substring-search/zsh-history-substring-search.zsh ] && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting

export NVM_DIR=~/.nvm

if [ "$(uname)" = "Darwin" ]; then
  export CHROME_BIN="/usr/local/Caskroom/google-chrome/latest/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
  # Do soemthing on Linux
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
  # Do something under Windows NT platform
fi

# If a space is added before the command, don't add it to history
# Useful if you enter your password in a command
setopt HIST_IGNORE_SPACE

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Override `-R` from oh-my-zsh
export LESS="-FRX"
