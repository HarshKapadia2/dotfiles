# Customize PS1

These scripts are mainly used to customize the prompt statement (PS1 in
particular) for Git. It shows the current Git branch and some other repository
tracking information if a Git repository exists in any particular directory on
the current working directory.

## Usage

-	To install the PS1 customization

	```bash
	$ ./install # This script is located in the dotfiles/customize-ps1 directory
	$ source "$HOME/.bashrc" # So that changes reflect in the current terminal
	```

-	To disable the PS1 customization

	```bash
	$ ./disable # This script is located in the dotfiles/customize-ps1 directory
	$ source "$HOME/.bashrc" # So that changes reflect in the current terminal
	```

## Notes

-	The disable script does not remove the function added to the `.bashrc` file.
	It only removes the function call in the `.bashrc` file, effectively
	disabling the prompt customization.
-	The main logic for displaying the current Git branch name and repository
	status is in [the `git-prompt.sh` file](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
	that Git generously provides in its GitHub repository.
	-	The `git-prompt.sh` file has all the available options and other details
		explained in a comment at the start of the script.

## Resources

-	The `__git_ps1` function
	-	[Don’t Reinvent the Wheel](https://web.archive.org/web/20160704140739/http://ithaca.arpinum.org/2013/01/02/git-prompt.html)
	-	[The `git-prompt.sh` file](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
	-	[Adding git branch on the Bash command prompt](https://stackoverflow.com/questions/15883416/adding-git-branch-on-the-bash-command-prompt)
-	Controlling the prompt
	-	[Bash Shell: Take Control of PS1, PS2, PS3, PS4 and PROMPT_COMMAND](https://www.thegeekstuff.com/2008/09/bash-shell-take-control-of-ps1-ps2-ps3-ps4-and-prompt_command)
	-	[Bash Reference Manual: Controlling the Prompt](https://www.gnu.org/software/bash/manual/bash#Controlling-the-Prompt)
-	Bash coloring
	-	[What color codes can I use in my Bash PS1 prompt?](https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-bash-ps1-prompt)
	-	[How to Customize (and Colorize) Your Bash Prompt](https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt)
-	If the prompt/`.bashrc` is messed up and a new terminal crashes immediately
	on opening, the following might help
	-	[How do I fix a .bashrc that makes it impossible to log into a remote server?](https://stackoverflow.com/questions/48601381/how-do-i-fix-a-bashrc-that-makes-it-impossible-to-log-into-a-remote-server)
		-	[How to Use SFTP Command to Transfer Files](https://linuxize.com/post/how-to-use-linux-sftp-command-to-transfer-files)

