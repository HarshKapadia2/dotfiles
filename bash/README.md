# Bash

Custom Bash aliases are maintained in the
[`.bash_aliases_harsh`](.bash_aliases_harsh) file.

The [`install`](install) script symlinks the aforementioned custom aliases file
and sources it the user's `.bashrc` file. The [`uninstall`](uninstall) script
unlinks the aliases file and removes the sourcing codeblock from `.bashrc`.

NOTE: Make sure to run `source ~/.bashrc` after running the installation or
uninstallation script for changes to take effect in the current terminal.

