# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

source $HOME/.local.zshrc

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git z sudo brew npm mvn zsh-syntax-highlighting history-substring-search)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias npm-pack-info='tarball="$(npm pack .)"; wc -c "${tarball}"; tar tvf "${tarball}"; rm "${tarball}";'
alias gits='git s'

export EDITOR='vim'

# Setup zsh-autosuggestions
[ -s $HOME/.zsh-autosuggestions/autosuggestions.zsh ] && source $HOME/.zsh-autosuggestions/autosuggestions.zsh

export NVM_DIR=~/.nvm

if [ "$(uname)" = "Darwin" ]; then
  source $(brew --prefix nvm)/nvm.sh
  export CHROME_BIN="/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app/Contents/MacOS/Google Chrome"
  alias fuck='$(thefuck $(fc -ln -1))'
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    alias fuck='eval $(thefuck $(fc -ln -1))'
#elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    # Do something under Windows NT platform
fi

alias ccat="pygmentize -g"
export PATH=${PATH}:~/.scripts
export PATH=${PATH}:~/npm/bin

export JBOSS_HOME=/usr/local/opt/wildfly-as/libexec
export PATH=${PATH}:${JBOSS_HOME}/bin

alias idea='nocorrect idea'
alias vcsh='nocorrect vcsh'
alias config='nocorrect config'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
