ZSH_THEME="my"
CASE_SENSITIVE="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/dotfiles/bin/user:$PATH"

# Use riprgrep with FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

alias bs="brew services"
alias dcom="docker-compose -f docker-compose-linux.yml"
alias e="vim"
alias flushdns="sudo killall -HUP mDNSResponder"
alias machina="$HOME/rosh/emqb/bin/machina"
alias mycopy="pbcopy"
alias mypaste="pbpaste"
alias sourceme="source $HOME/.zshrc"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
kill_touch_screen () {
  xinput disable `xinput --list | egrep -o "Touchscreen.+id=[0-9]+" | egrep -o "[0-9]+"`
}
alias killtouch=kill_touch_screen
alias python="python3"

alias clog="~/github/clog/clog"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# fnm
export PATH=/home/chuck/.fnm:$PATH
eval "`fnm env`"

bindkey '^K' autosuggest-accept

alias ngrok="~/ngrok"

# fnm
export PATH=/home/chuck/.fnm:$PATH
eval "`fnm env`"

# geckodriver
export PATH="$HOME/github/gambling/gamblor/bin/geckodriver-v0.28.0-linux32:$PATH"

# DJANGO CHAINS
alias pmg="python3 manage.py"

export PYTHON="/usr/bin/python2"
