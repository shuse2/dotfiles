# Executes commands at the start of an interactive session.
# also, setup path and settings

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export GOPATH=$HOME/Documents/20_projects/gohome
export PATH="$PATH:$GOPATH/bin"

. `brew --prefix`/etc/profile.d/z.sh

export VISUAL=vim
export EDITOR="$VISUAL"

alias l="ls -al"
export MODE=local

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GPG_TTY=$(tty)

# lisk autocomplete setup
LISK_AC_ZSH_SETUP_PATH=/Users/stoda/Library/Caches/lisk-commander/autocomplete/zsh_setup && test -f $LISK_AC_ZSH_SETUP_PATH && source $LISK_AC_ZSH_SETUP_PATH;