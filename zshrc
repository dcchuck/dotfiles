
 # #########
 #
 # Oh-My-ZSH Stuff
 #
 # #########

# Theme
# stripped version of another theme; installed in bin/setup
ZSH_THEME="my"
# Use case sensitve completion
CASE_SENSITIVE="true"

# installed via bin/setup
# git gives me the nuce status line; autosuggestions rely on the history for
# autocomplete
plugins=(git zsh-autosuggestions)
bindkey '^K' autosuggest-accept

# this actually loads the plugins and does some other oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

 # #########
 #
 # Alias Section
 #
 # #########

alias sourceme="source $HOME/.zshrc"

# Django
alias pman="python3 manage.py"
alias pmanplus="python3 manage.py shell_plus"

case `uname` in
  Darwin)
    alias o="open"
    alias e="/opt/homebrew/bin/vim"

    # Mac specific
    alias bs="brew services"
    alias flushdns="sudo killall -HUP mDNSResponder"
  ;;
  Linux)
    alias o="xdg-open"
    alias e="vim"
  ;;
esac

 # #########
 #
 # Path Section
 #
 # #########

# setup fnm
# https://github.com/Schniz/fnm#shell-setup
eval "$(fnm env --use-on-cd)"

# enable fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add clog command
export PATH="$HOME/.captains-log/bin:$PATH"

# add code command
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# my custom scripts that I want added to my path
export PATH="$HOME/dotfiles/bin/user:$PATH"

# Use riprgrep with FZF
# Leaving this off for now
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# Keeping this here
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

##
# GO
##

export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

##
# ENDGO
##

export PATH="$HOME/.lbranch/bin:$PATH"
alias lb=lbranch
