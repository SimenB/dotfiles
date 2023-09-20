export PATH=${PATH}:~/.scripts
export PATH=${PATH}:~/npm/bin
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"
export PATH=${PATH}:${JBOSS_HOME}/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export JBOSS_HOME=/usr/local/opt/wildfly-as/libexec

export FZF_DEFAULT_COMMAND="fd --hidden --color never --exclude .git/ --type file"
export FZF_CTRL_R_OPTS="--exact"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
export BAT_CONFIG_PATH="$HOME/.config/bat/batrc"

export NVM_SYMLINK_CURRENT=true

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export GOHOME=$HOME/go
export PATH=$PATH:$GOHOME/bin

# Added by Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# Make sure stuff installed with brew takes priority
export PATH="/opt/homebrew/bin:$PATH"
