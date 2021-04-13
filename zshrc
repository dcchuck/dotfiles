ZSH_THEME="my"
CASE_SENSITIVE="true"

# installed via bin/setup
plugins=(git zsh-autosuggestions)
bindkey '^K' autosuggest-accept

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
alias e="vim"
alias flushdns="sudo killall -HUP mDNSResponder"
alias sourceme="source $HOME/.zshrc"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias python="python3"


# fnm
export PATH=/home/chuck/.fnm:$PATH
eval "`fnm env`"

case `uname` in
  Darwin)
    alias mycopy="pbcopy"
    alias o="open"
  ;;
  Linux)
    alias mycopy="xclip -selection clipboard"
    alias o="xdg-open"
  ;;
esac
