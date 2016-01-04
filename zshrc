# Executes commands at the start of an interactive session.
# also, setup path and settings

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export GOPATH=$HOME/Documents/20_projects/gohome
export PATH=$GOPATH/bin:$PATH

. `brew --prefix`/etc/profile.d/z.sh

export VISUAL=vim
export EDITOR="$VISUAL"
