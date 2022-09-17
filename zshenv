# source is a synonym for dot/period '.' in bash, but not in POSIX sh,
# so for maximum compatibility use the period.
. "$HOME/.cargo/env"


case `uname` in
  Darwin)
    alias mycopy="pbcopy"
  ;;
  Linux)
    alias mycopy="xclip -selection clipboard"
  ;;
esac
