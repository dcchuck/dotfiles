export ZSH=/Users/chuck/.oh-my-zsh

ZSH_THEME="friskChuck"
CASE_SENSITIVE="true"

source $ZSH/oh-my-zsh.sh

alias sml="/usr/local/Cellar/smlnj/110.83/bin/sml"
alias flushdns="sudo killall -HUP mDNSResponder"
alias sourceme="source ~/.zshrc"
alias e="vim"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Node
alias nodetree="tree -I node_modules"
alias nodeglobal="npm ls -g --depth=0"

# Github
alias Gorigin="git remote show origin"
alias Gremote="git remote -v"

# Templates
alias tmplHTML="cp ~/dotfiles/templates/index.html ."
alias tmplICO="cp ~/dotfiles/templates/favicon.ico ."
alias tmplGIT="cp ~/dotfiles/templates/nodegit .gitignore"
alias tmplTYPE="cp -r ~/dotfiles/templates/Typescript/. ."
alias tmplTERN="cp ~/dotfiles/templates/tern-project ./.tern-project"
alias tmplWP3="cp ~/dotfiles/templates/webpack3 ./webpack.config.js"

export PATH="$PATH:/path/to/depot_tools"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export ANDROID_HOME="/Users/chuck/Library/Android/sdk"  
