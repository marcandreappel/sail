# Laravel Sail ZSH plugin
#
# Settings:
: ${SAIL_ZSH_BIN_PATH:="./vendor/bin/sail"}

# Add the sail shell alias.
alias sail="[ -f $SAIL_ZSH_BIN_PATH ] && sh $SAIL_ZSH_BIN_PATH || echo 'Sail not found'"

# Enable multiple commands with sail
function artisan \
         composer \
         node \
         npm \
         npx \
         php \
         yarn {
  if checkForSail; then
    sail "$0" "$@"
  else
    command "$0" "$@"
  fi
}

# Check for the file in the current and parent directories.
checkForSail() {
  # Check if ./vendor directory exists and if ./vendor/bin/sail file exists.
  if [[ -d "./vendor" && -f $SAIL_ZSH_BIN_PATH ]]; then
    return 0
  else
    # Could not find $SAIL_ZSH_BIN_PATH in the current directory
    # or in any of its parents up to $SAIL_ZSH_PROJECTS_DIRECTORY
    return 1
  fi
}
