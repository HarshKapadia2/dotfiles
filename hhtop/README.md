# hhtop

A wrapper utility for [htop](https://htop.dev) that sets different `htoprc`
config files depending on various factors (listed in the [Notes](#notes) section
below).

## Usage

-	To install hhtop

	```bash
	$ ./install # This script is located in the dotfiles/hhtop directory
	$ source "$HOME/.bashrc" # So that changes reflect in the current terminal
	```

-	To run hhtop

	```bash
	$ hhtop # This command will be available to the user anywhere on the
			# system as long as they are acting as themselves and/or have not
			# logged in as another user
	```

-	To uninstall hhtop

	```bash
	$ ./uninstall # This script is located in the dotfiles/hhtop directory
	$ source "$HOME/.bashrc" # So that changes reflect in the current terminal
	```

## Notes

-	Any changes to `htoprc` will be overwritten when hhtop is run. If one
	desires to keep the current `htoprc`, then invoke htop using the usual
	`htop` command and not the `hhtop` command.

-	Difference between the htoprc files

	| File Name | Differences |
	| --------- | ----------- |
	| `htoprc.1.bkp` | CPUs in 2 columns per half and frequencies displayed |
	| `htoprc.2.bkp` | No CPU columns and frequencies displayed |
	| `htoprc.3.bkp` | CPUs in 8 columns per half and frequencies not displayed |

-	How is the appropriate `htoprc` file chosen?

	| No. of Online CPUs | No. of Columns in Terminal | File Chosen |
	| :----------------: | :------------------------: | :---------: |
	| <= 64 | <= 180 | `htoprc.1.bkp` |
	| > 64 && <= 192 | <= 180 | `htoprc.2.bkp` |
	| > 192 | <= 180 | `htoprc.2.bkp` |
	| <= 64 | > 180 | `htoprc.1.bkp` |
	| > 64 && <= 192 | > 180 | `htoprc.3.bkp` |
	| > 192 | > 180 | `htoprc.2.bkp` |

-	The `.bkp` file extension stands for 'backup' in this case. There is nothing
	special about the file. It's a regular ASCII text file.

-	hhtop abbreviation meaning
	-	hhtop = Harsh's htop
	-	[htop](https://htop.dev) = Hisham's top
	-	[top](https://www.man7.org/linux/man-pages/man1/top.1.html) = A Linux command to display processes

-	Why was this utility made?
	-	I log into multiple machines with varying number of CPUs and on
		different screen/terminal sizes, and it was getting frustraing to have
		to set the htop view every time. Thus, I thought of automating it.
	-	It probably took more time to automate it than if I manually made the
		changes every time, it might turn out to be a useless utility and it was
		definitely not the actual work I was supposed to do, but I learnt a lot
		while making it.

## Resources

-	[A Beginners Guide to htop for Process Management](https://spin.atomicobject.com/htop-guide)
-	[Why are there many processes listed under the same title in htop?](https://superuser.com/questions/118086/why-are-there-many-processes-listed-under-the-same-title-in-htop)
-	[My htop Setup + Tips on making your own!](https://dev.to/janjitsu/my-htop-setup-3fng)
-	[htop: Quick Guide & Customization](https://linuxblog.io/htop-quick-guide-customization)
-	[How can I set customise settings for htop?](https://unix.stackexchange.com/questions/147885/how-can-i-set-customise-settings-for-htop)

