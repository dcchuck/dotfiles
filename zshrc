export ZSH=/Users/chuck/.oh-my-zsh

ZSH_THEME="friskChuck"
CASE_SENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"

# Use riprgrep with FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# FZF - to toggle fuzzy completion & key bindins, see ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#   /\
#  /o \ LIAS
# /_/\_\

alias e="vim"
alias E="vim \$(fzf)"
alias sourceme="source ~/.zshrc"
alias tmplHTML="cp ~/dotfiles/templates/index.html ."
alias tmplICO="cp ~/dotfiles/templates/favicon.ico ."
alias tmplGIT="cp ~/dotfiles/templates/nodegit .gitignore"

# Docker
alias dcom="docker-compose"
# Rosh
alias machina="~/rosh/emqb/bin/machina"

# OS Specific Commands
case `uname` in
  Darwin)
    alias flushdns="sudo killall -HUP mDNSResponder"
    alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
    alias bs="brew services"
    alias sml="/usr/local/Cellar/smlnj/110.83/bin/sml"
    alias mycopy="pbcopy"
    alias mypaste="pbpaste"
    . "/usr/local/opt/nvm/nvm.sh"

    export ANDROID_HOME="/Users/chuck/Library/Android/sdk"
    export PATH="/usr/local/opt/libxml2/bin:$PATH"

    export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
  ;;
  Linux)
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  ;;
esac
