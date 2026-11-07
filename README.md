magic-enter
===========

A customizable fork of the magic enter feature from [subnixr's minimal] prompt
theme. Shown when the start of a command line is empty and user presses ENTER.

What does it show?
------------------

  * Info line:
    * The last command exit status only if it is not 0.
    * The number of background jobs only if there is at least one.
    * The current username, hostname and working directory.
  * The directory stack if it's not empty.
  * `ls -AF` output.
  * Concise `git status` only when inside a git repo.

Settings
--------

The following environment variable is used to color the last command exit status
in the info line:

| Variable       | Description        | Default value |
| -------------- | ------------------ | ------------- |
| MNML_ERR_COLOR | Color for failures | `red`         |

The commands to be executed in Zsh when magic enter is shown can be customized
using:

    zstyle ':zim:magic-enter' commands '<command>'...

This is how the default configuration looks like:

    zstyle ':zim:magic-enter' commands \
        'if (( ${#dirstack} )) print -P %F{244}${${(Dq+)dirstack}//\//%f\/%F{244}}%f' \
        'ls -AF' \
        'git --no-pager status -sb --untracked-files=no 2>/dev/null'

And here's an example of a customized configuration:

    zstyle ':zim:magic-enter' commands \
        'ls -F' \
        'jj st --no-pager 2>/dev/null || git --no-pager status -sb 2>/dev/null'

[subnixr's minimal]: https://github.com/subnixr/minimal
