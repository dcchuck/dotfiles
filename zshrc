export ZSH=/home/chuck/.oh-my-zsh

ZSH_THEME="friskChuck"
CASE_SENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias sml="/usr/local/Cellar/smlnj/110.83/bin/sml"
alias flushdns="sudo killall -HUP mDNSResponder"
alias sourceme="source ~/.zshrc"
alias e="vim"
alias o="xdg-open"
alias tat="~/dotfiles/bin/tat"

# Node
alias nodetree="tree -I node_modules"
alias nodeglobal="npm ls -g --depth=0"

# Templates
alias tmplHTML="cp ~/dotfiles/templates/index.html ."
alias tmplICO="cp ~/dotfiles/templates/favicon.ico ."
alias tmplGIT="cp ~/dotfiles/templates/nodegit .gitignore"
alias tmplTYPE="cp -r ~/dotfiles/templates/Typescript/. ."
alias tmplTERN="cp ~/dotfiles/templates/tern-project ./.tern-project"
alias tmplWP3="cp ~/dotfiles/templates/webpack3 ./webpack.config.js"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PATH="/home/chuck/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# Rails
alias brails="bundle exec rails"
alias brake="bundle exec rake"

