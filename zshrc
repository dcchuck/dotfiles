ZSH_THEME="friskChuck"
CASE_SENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/dotfiles/bin/user:$PATH"

export NVM_DIR="$HOME/.nvm"

case `uname` in
  Darwin)
    . "/usr/local/opt/nvm/nvm.sh"
  ;;
  Linux)
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  ;;
esac

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Use riprgrep with FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# FZF - to toggle fuzzy completion & key bindins, see ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias bs="brew services"
alias dcom="docker-compose"
alias e="vim"
alias flushdns="sudo killall -HUP mDNSResponder"
alias machina="~/rosh/emqb/bin/machina"
alias mycopy="pbcopy"
alias mypaste="pbpaste"
alias sourceme="source ~/.zshrc"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

export ANDROID_HOME="/Users/chuck/Library/Android/sdk"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
