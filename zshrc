# Executes commands at the start of an interactive session.

# Docker CLI completions. Must be on fpath before Prezto runs compinit.
fpath=(/Users/shuse2/.docker/completions $fpath)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export VISUAL=vim
export EDITOR="$VISUAL"

# nvm: put the default Node on PATH now, and load nvm.sh (~0.9 s) on first use.
export NVM_DIR="$HOME/.nvm"
if [[ -r "$NVM_DIR/alias/default" ]]; then
  nvm_default_bins=("$NVM_DIR"/versions/node/v${$(<"$NVM_DIR/alias/default")#v}*(N/nOn))
  (( ${#nvm_default_bins} )) && export PATH="${nvm_default_bins[1]}/bin:$PATH"
  unset nvm_default_bins
fi
nvm() {
  unfunction nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

z_sh="${HOMEBREW_PREFIX:-/opt/homebrew}/etc/profile.d/z.sh"
[[ -r "$z_sh" ]] && . "$z_sh"
unset z_sh

export GPG_TTY=$TTY

# rbenv: shims on PATH now, the full init on first use of the rbenv command.
export PATH="$HOME/.rbenv/shims:$PATH"
rbenv() {
  unfunction rbenv
  eval "$(command rbenv init - zsh)"
  rbenv "$@"
}

export GOPATH="$HOME/go"
# pyenv: shims on PATH is all `pyenv init --path` does.
export PATH="$HOME/.pyenv/shims:${PATH}"
export PATH="$GOPATH/bin:${PATH}"
export PATH="$HOME/flutter:${PATH}"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shuse2/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shuse2/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shuse2/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shuse2/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export CGO_CFLAGS="-I/opt/homebrew/include"
export CGO_LDFLAGS="-L/opt/homebrew/lib"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/shuse2/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/shuse2/.bun/_bun" ] && source "/Users/shuse2/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
