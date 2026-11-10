# [ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && . $HOME/.travis/travis.sh

# expo development
[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ] && . $HOME/.nix-profile/etc/profile.d/nix.sh

# rust & cargo stuff
[ -f $HOME/.cargo/env ] && . $HOME/.cargo/env
