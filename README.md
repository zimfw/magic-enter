magic-enter
===========

A fork of the magic enter feature from [subnixr's minimal] prompt theme.
Shown when there is no command and user presses ENTER.

What does it show?
------------------

  * Info line:
    * The last command exit status only if it is not 0.
    * The number of background jobs only if there is at least one.
    * The current username, hostname and working directory.
    * The number of visible files, followed by the number of hidden files if any.
  * The directory stack if it's not empty.
  * `ls` output.
  * Concise `git status` only when inside a git repo.

[subnixr's minimal]: https://github.com/subnixr/minimal
