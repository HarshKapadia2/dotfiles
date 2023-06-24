# Dotfiles

[Harsh Kapadia](https://harshkapadia.me)'s dotfiles.

## Setup

The [`setup` script](setup) will symlink dotfiles to the current user's home directory and optionally install packages. The behaviour depends on the arguments with which the script is invoked.

### Arguments

#### No arguments

Symlink all dotfiles to the current user's home directory. Dotfiles that already exist in the current user's home directory will be skipped. No packages will be installed.

#### `--force-setup`

For every dotfile in the repository, delete the corresponding dotfile/symlink in the current user's home directory and then symlink the dotfile.

#### `--install-pkg`

Install packages on supported OSs. Symlinking will be done after package installation.

Packages installed

-   `git`
-   `man`
-   `net-tools` (For `ifconfig`)
-   `vim`

OSs supported

-   Debian-based distros that support APT, like Ubuntu.

### Execution Instructions

> NOTE: It is expected that the dotfiles repository is placed in the current user's home directory.

```bash
# Navigate to the current user's home directory
$ cd ~

# Clone the repository
$ git clone https://github.com/HarshKapadia2/dotfiles.git

# Navigate to the dotfiles repository
$ cd ~/dotfiles

# Run the set up script from the repository directory
$ ./setup
# Or
$ bash setup
# Or with arguments
$ ./setup --force-setup --install-pkg

# Check changes
$ ls -al ~
```

## Dotfiles Present

-   [clang-format](https://clang.llvm.org/docs/ClangFormat.html): [.clang-format](.clang-format)
-   [Git](https://git-scm.com): [.gitconfig](.gitconfig)
-   [Prettier](https://prettier.io): [.prettierrc](.prettierrc)
-   [Vim](https://www.vim.org): [.vimrc](.vimrc)

## Resources

-   [The Missing Semester of Your CS Education: Dotfiles](https://missing.csail.mit.edu/2020/command-line/#dotfiles)
-   [What Is "rc" and What Are "rc" Files?](https://www.baeldung.com/linux/rc-files)
-   [Things to keep in mind about Symbolic Links](https://linuxhandbook.com/symbolic-link-linux/#things-to-keep-in-mind-about-symbolic-links)
