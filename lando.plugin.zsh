LANDO_ZSH_SITES_DIRECTORY="$HOME/Sites"

LANDO_ZSH_CONFIG_FILE=./.lando.yml

# Enable wp command with lando.
function wp(){

  if checkForFile $LANDO_ZSH_CONFIG_FILE $LANDO_ZSH_SITES_DIRECTORY ; then
    # Run Lando wp
    lando wp "$@"
  else
    # Run System wp
    command wp "$@"
  fi
}

# Enable composer command.
function composer(){

  if checkForFile $LANDO_ZSH_CONFIG_FILE $LANDO_ZSH_SITES_DIRECTORY ; then
    # Run Lando composer
    echo "Using 'lando composer'"
    lando composer "$@"
  else
    # Run System composer
    command composer "$@"
  fi
}

# Enable artisan command.
function artisan(){

  if checkForFile $LANDO_ZSH_CONFIG_FILE $LANDO_ZSH_SITES_DIRECTORY ; then
    # Run Lando artisan
    lando artisan "$@"
  else
    # Run System artisan
    command artisan "$@"
  fi
}

# Enable yarn command for lando if lando file exists in directory.
function yarn(){

  if checkForFile $LANDO_ZSH_CONFIG_FILE $LANDO_ZSH_SITES_DIRECTORY ; then
    echo "Running Lando yarn...";
    # Run Lando yarn
    lando yarn "$@"
  else
    echo "Running System yarn...";
    # Run System yarn
    command yarn "$@"
  fi
}

# Enable npm command for lando if lando file exists in directory.
function npm(){

  if checkForFile $LANDO_ZSH_CONFIG_FILE $LANDO_ZSH_SITES_DIRECTORY ; then
    echo "Running Lando npm...";
    # Run Lando NPM
    lando npm "$@"
  else
    echo "Running System npm...";
    # Run System NPM
    command npm "$@"
  fi
}

# Enable gulp command.
function gulp(){

  if checkForFile $LANDO_ZSH_CONFIG_FILE $LANDO_ZSH_SITES_DIRECTORY ; then
    echo "Running Lando gulp...";
    # Run Lando gulp
    lando gulp "$@"
  else
    echo "Running System gulp...";
    # Run System gulp
    command gulp "$@"
  fi
}

# Enable drush command.
function drush(){

  if checkForFile $LANDO_ZSH_CONFIG_FILE $LANDO_ZSH_SITES_DIRECTORY ; then
    echo "Running Lando drush...";
    # Run Lando drush
    lando drush "$@"
  else
    echo "Running System drush...";
    # Run System drush
    command drush "$@"
  fi
}


# Check for the file in the current and parent directories.
# $1: The file to search for (string)
# $2: The directory to search up to.
checkForFile(){

  local current_directory="$PWD"

  # Bash is backwards. 0 is true 1 (non-zero) is false.
  flag="1"

  # Only bother checking for lando within the Sites directory.
  if [[ ":$PWD:" == *":$2"* ]]; then

    echo "Checking for file: $1 within $2..."

    while true; do
      if [ $current_directory != "$2" ]; then
          if [ -f "$current_directory/$1" ]; then
            return "0"
          fi
        current_directory="$(dirname $current_directory)"
      else
        break;
      fi
    done

    if [[ "$flag" == "1" ]]; then
      echo "Could not find $1 in the current directory or in any of its parents up to $2."
    fi

  else

    echo "Checking for file: $1"

    if [ -f "$1" ]; then
      echo "Found it"
      return 0
    else
      echo "Not Found"
      return "1"
    fi

    if [[ "$flag" == "1" ]]; then
      echo "Could not find $1."
    fi

  fi

  return $flag

}
