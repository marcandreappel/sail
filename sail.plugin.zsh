# Laravel Sail ZSH plugin
#
# Settings.
: ${SAIL_ZSH_PROJECTS_DIRECTORY:="$HOME/Projects"}
: ${SAIL_ZSH_BIN_PATH:=vendor/bin/sail}

# Add the sail shell alias.
alias sail="[ -f sail ] && sh sail || sh $SAIL_ZSH_BIN_PATH"

# Enable multiple commands with sail.
function artisan \
         composer \
         node \
         npm \
         npx \
         php \
         yarn {
  if checkForSailPackage; then
    sail "$0" "$@"
  else
    command "$0" "$@"
  fi
}

# Check for the file in the current and parent directories.
checkForSailPackage() {
  # Only bother checking for sail within the projects directory.
  if [[ "$PWD/" != "$SAIL_ZSH_PROJECTS_DIRECTORY"/* ]]; then
    # Not within $SAIL_ZSH_PROJECTS_DIRECTORY
    return 1
  fi

  local curr_dir="$PWD"
  # Checking for file: $SAIL_ZSH_BIN_PATH within $SAIL_ZSH_PROJECTS_DIRECTORY...
  while [[ "$curr_dir" != "$SAIL_ZSH_PROJECTS_DIRECTORY" ]]; do
    if [[ -f "$curr_dir/$SAIL_ZSH_BIN_PATH" ]]; then
      return 0
    fi
    curr_dir="${curr_dir:h}"
  done

  # Could not find $SAIL_ZSH_BIN_PATH in the current directory
  # or in any of its parents up to $SAIL_ZSH_PROJECTS_DIRECTORY.
  return 1
}
