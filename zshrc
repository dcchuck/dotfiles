# Homebrew for packages
eval "$(/opt/homebrew/bin/brew shellenv)"

# mise-en-place for developer tooling
eval "$(mise activate zsh)"
alias m="mise"

# use my personal theme
ZSH_THEME="my"
# Use case sensitve completion
CASE_SENSITIVE="true"

# installed via bin/setup
plugins=(git zsh-autosuggestions)
bindkey '^K' autosuggest-accept

# this actually loads the plugins and does some other oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Alias Section
# Form
alias o="open"
alias e="/opt/homebrew/bin/vim"
alias n="pnpm"
alias bs="brew services"
alias dc="docker compose"
alias lb=lbranch
# Function
alias flushdns="sudo killall -HUP mDNSResponder"
alias sourceme="source $HOME/.zshrc"

# Path Section
# code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
# my custom scripts that I want added to my path
export PATH="$HOME/dotfiles/bin/user:$PATH"

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source local configuration if it exists
if [[ -f "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi
