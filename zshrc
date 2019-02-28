export ZSH=/Users/chuck/.oh-my-zsh

ZSH_THEME="friskChuck"
CASE_SENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias sml="/usr/local/Cellar/smlnj/110.83/bin/sml"
alias flushdns="sudo killall -HUP mDNSResponder"
alias sourceme="source ~/.zshrc"
alias e="vim"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Node
alias nodetree="tree -I node_modules"
alias nodeglobal="npm ls -g --depth=0"

# Docker
alias dcom="docker-compose"

alias vrosh="~/rosh/emqb/bin/setup"

# Templates
alias tmplHTML="cp ~/dotfiles/templates/index.html ."
alias tmplICO="cp ~/dotfiles/templates/favicon.ico ."
alias tmplGIT="cp ~/dotfiles/templates/nodegit .gitignore"
alias tmplTERN="cp ~/dotfiles/templates/tern-project ./.tern-project"

export PATH="$PATH:/path/to/depot_tools"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export ANDROID_HOME="/Users/chuck/Library/Android/sdk"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
