magic-enter
===========

A minimal fork of the magic enter feature from [subnixr's minimal] prompt theme.
Shown when the start of a command line is empty and user presses ENTER.

What does it show?
------------------

  * Info line:
    * The last command exit status only if it is not 0.
    * The number of background jobs only if there is at least one.
    * The current username, hostname and working directory.
  * The directory stack if it's not empty.
  * `ls -AF` output.
  * Concise `git status` only when inside a git repo.

[subnixr's minimal]: https://github.com/subnixr/minimal
