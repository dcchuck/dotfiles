export ZSH=/Users/chuck/.oh-my-zsh

ZSH_THEME="friskChuck"
CASE_SENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias bs="brew services"
alias e="vim"
alias flushdns="sudo killall -HUP mDNSResponder"
alias sourceme="source ~/.zshrc"
alias sml="/usr/local/Cellar/smlnj/110.83/bin/sml"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Docker
alias dcom="docker-compose"

# Templates
alias tmplHTML="cp ~/dotfiles/templates/index.html ."
alias tmplICO="cp ~/dotfiles/templates/favicon.ico ."
alias tmplGIT="cp ~/dotfiles/templates/nodegit .gitignore"

export PATH="$PATH:/path/to/depot_tools"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export ANDROID_HOME="/Users/chuck/Library/Android/sdk"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

export PATH="$HOME/.cargo/bin:$PATH"

# MACHINA!
alias machina="~/rosh/emqb/bin/machina"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias ifiles="vim \$(fzf)"

# FZF - to toggle fuzzy completion & key bindins, see ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
