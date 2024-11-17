# Dotfiles

[Harsh Kapadia](https://harshkapadia.me)'s dotfiles.

## Dotfiles Present

-   [clang-format](https://clang.llvm.org/docs/ClangFormat.html): [`.clang-format`](.clang-format)
-   [EditorConfig](https://editorconfig.org): [`.editorconfig`](.editorconfig)
-   [Git](https://git-scm.com): [`.gitconfig`](.gitconfig)
-   [Prettier](https://prettier.io): [`.prettierrc`](.prettierrc)
-   [tmux](https://tmux.github.io): [`.tmux.conf`](.tmux.conf)
-   [Vim](https://www.vim.org): [`.vimrc`](.vimrc)

## Setup

The [`setup` script](setup) will symlink dotfiles to the current user's home
directory and optionally install packages. The behaviour depends on the
arguments with which the script is invoked.

### Arguments

```bash
./setup [--force-setup] [--install-pkg] [--help]
```

#### No arguments

-   Symlink all dotfiles to the current user's home directory.
    -   Dotfiles that already exist in the current user's home directory will be
        skipped.
-   No packages will be installed.

#### `--force-setup`

-   For every Dotfile in the repository, delete the corresponding
    dotfile/symlink in the current user's home directory (if it exists) and then
    Symlink the Dotfile.
-   Requirement: Optional

#### `--install-pkg`

-   Install packages and plugin-extras on supported OSs. Symlinking (setup) will
	be done after package installation.
-   Requirement: Optional, but note that some Vim plugins depend on packages to
    be installed to work.
-   Packages installed
	-	`bear` (For `YouCompleteMe` Vim plugin)
	-	`build-essential` (For `YouCompleteMe` Vim plugin)
    -   `clang-format` (For formatting C files)
	-	`cmake` (For `YouCompleteMe` Vim plugin)
    -   `curl`
    -   `git`
    -   `man`
    -   `net-tools` (For `ifconfig`)
    -   `nodejs` (For `prettier`)
    -   `npm` (For `prettier`)
	-	`python3`
	-	`python3-dev` (For `YouCompleteMe` Vim plugin)
    -   `shellcheck`
    -   `shfmt` (For formatting Shell/Bash scripts)
    -   `tmux`
    -   `vim`
-   OSs supported
    -   Debian-based distros that support APT, like Ubuntu.
-   NOTE: `shfmt` is available only on Ubuntu >= v22 and so **the script will
	fail on Ubuntu OSs < v22**.

#### `--delete`

-	Remove all dotfile symlinks and delete any related files, like all Vim
	plugins mentioned in the .vimrc file.
-	Packages are not uninstalled.
-	No other flag will be executed if this flag is mentioned.
-	Requirement: Optional

#### `--help`

-   Print this command usage instruction.
-   Requirement: Optional

### Execution Instructions

```bash
# Navigate to the current user's home directory
$ cd ~

# Clone the repository
$ git clone https://github.com/HarshKapadia2/dotfiles.git

# Navigate to the dotfiles repository
$ cd ~/dotfiles

# Run the setup script
$ ./setup
# Or
$ bash setup
# Or with arguments
$ ./setup --force-setup --install-pkg

# Check changes
$ ls -al ~ # Symlinked dotfiles should be present
```

## Resources

-   [The Missing Semester of Your CS Education: Dotfiles](https://missing.csail.mit.edu/2020/command-line/#dotfiles)
-   [What Is "rc" and What Are "rc" Files?](https://www.baeldung.com/linux/rc-files)
-   [Things to keep in mind about Symbolic Links](https://linuxhandbook.com/symbolic-link-linux/#things-to-keep-in-mind-about-symbolic-links)
-   [Solving the Dotfiles Problem (And Learning Bash)](https://www.youtube.com/watch?v=mSXOYhfDFYo)
