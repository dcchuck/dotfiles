ZSH_THEME="my"
CASE_SENSITIVE="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/dotfiles/bin/user:$PATH"

export NVM_DIR="$HOME/.nvm"

# TODO - nvm is incredibly slow! We need a new tool for this.
case `uname` in
  Darwin)
    . "/usr/local/opt/nvm/nvm.sh"
  ;;
  Linux)
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    # Disable the touch screen on my linux machine...
  ;;
esac

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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
alias dcom="docker-compose"
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

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
