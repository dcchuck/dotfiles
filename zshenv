case `uname` in
  Darwin)
    export ZSH=$HOME/.oh-my-zsh
    alias mycopy="pbcopy"
    alias o="open"
  ;;
  Linux)
    export ZSH=$HOME/.oh-my-zsh
    alias mycopy="xclip -selection clipboard"
    alias o="xdg-open"
    # eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  ;;
esac
