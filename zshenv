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
