case `uname` in
  Darwin)
    export ZSH=/Users/chuck/.oh-my-zsh
    alias mycopy="pbcopy"
    alias o="open"
  ;;
  Linux)
    export ZSH=/home/chuck/.oh-my-zsh
    alias mycopy="xclip -selection clipboard"
    alias o="xdg-open"
  ;;
esac
