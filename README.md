# Laravel Sail ZSH (sail-zsh)

This plugin adds aliases for using various languages and frameworks with [Laravel Sail](https://laravel.com/docs/9.x/sail) for Docker. It will only run within sail-driven project directories.

To use it, add `sail` to the plugins array in your zshrc file:

```zsh
plugins=(... sail)
```

## Commands

| Alias      | Description     |
|:----------:|:---------------:|
| `artisan`  | `sail artisan`  |
| `composer` | `sail composer` |
| `node`     | `sail node`     |
| `npm`      | `sail npm`      |
| `npx`      | `sail npx`      |
| `php`      | `sail php`      |
| `yarn`     | `sail yarn`     |

## How it works

This plugin removes the requirement to type `sail` before a command. It utilizes the sail version of supported commands run within directories where the `sail` command is found in the `vendor/bin` directory.

## Settings

The plugin will utilize the default values. Set the variable(s) below as needed in your .zshrc file to change these default values to match your development environment: (eg.: Add LANDO_ZSH_SITES_DIRECTORY=~/Projects to .zshrc)

- `SAIL_ZSH_PROJECTS_DIRECTORY`: The plugin will stop searching through parents for `SAIL_ZSH_BIN_PATH` once it hits this directory. This should be the top level directory of all your projects.
- `SAIL_ZSH_BIN_PATH`: The plugin will check to see if this provided path exists to check for presence of Laravel Sail. By default, the path is `vendor/bin/sail` but this can be changed if needed.

## Author of the original Lando plugin:

- Author: Joshua Bedford
- URL: [https://github.com/joshuabedford/lando-zsh](https://github.com/joshuabedford/lando-zsh)

