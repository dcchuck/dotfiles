export ZSH=/Users/chuck/.oh-my-zsh

ZSH_THEME="friskChuck"

CASE_SENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# For a full list of active aliases, run `alias`.

alias sml="/usr/local/Cellar/smlnj/110.80/bin/sml"
alias sourceme="source ~/.zshrc"
alias winhome="cd /Volumes/C/Users/Chuck"
alias vim="mvim -v"
alias notesdrive="cp -r ~/dotfiles/notes ~/Google\ Drive"

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

# OpenFin
alias OFstable="curl -s https://cdn.openfin.co/release/runtime/stable | grep ."
alias OFbeta="curl -s https://cdn.openfin.co/release/runtime/beta | grep ."
alias OFvanilla="cp -r ~/dotfiles/templates/OpenFin/vanilla/. ."
alias OFreact="cp -r ~/dotfiles/templates/OpenFin/react/. ."

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

export PATH="$PATH:/path/to/depot_tools"
