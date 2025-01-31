# source is a synonym for dot/period '.' in bash, but not in POSIX sh,
# so for maximum compatibility use the period.
# No rust on current system
# . "$HOME/.cargo/env"

# By declaring this as a function, I can use mycopy in places like tmux commands
mycopy() {
  case "$(uname)" in
    Darwin)
      command pbcopy "$@"
      ;;
    Linux)
      command xclip -selection clipboard "$@"
      ;;
  esac
}

export -f mycopy

