export PATH=${PATH}:~/.scripts
export PATH=${PATH}:~/npm/bin
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"
export PATH=${PATH}:${JBOSS_HOME}/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin # Add PostgreSQL binaries to $PATH

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export JBOSS_HOME=/usr/local/opt/wildfly-as/libexec

export FZF_DEFAULT_COMMAND="fd --hidden --color never --exclude .git/ --type file"
export FZF_CTRL_R_OPTS="--exact"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
export BAT_CONFIG_PATH="$HOME/.config/bat/batrc"

# python needs to be python 2
export PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH
