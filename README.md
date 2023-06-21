# Dotfiles

[Harsh Kapadia](https://harshkapadia.me)'s dotfiles.

## Setup

Running the [`setup.sh` file](setup.sh) will symlink files to the current user's home directory.

```bash
# Navigate to the current user's home directory
$ cd ~

# Clone the repository
$ git clone https://github.com/HarshKapadia2/dotfiles.git

# Run the set up script from the repository directory
$ cd ~/dotfiles
$ ./setup.sh
# Or
$ cd ~/dotfiles
$ bash setup.sh

# Check changes
$ ls -al ~
```

## Dotfiles Present

-   [Git](https://git-scm.com): [.gitconfig](.gitconfig)
-   [Vim](https://www.vim.org): [.vimrc](.vimrc)
-   [Prettier](https://prettier.io): [.prettierrc](.prettierrc)
-   [clang-format](https://clang.llvm.org/docs/ClangFormat.html): [.clang-format](.clang-format)

## Resources

-   [The Missing Semester of Your CS Education: Dotfiles](https://missing.csail.mit.edu/2020/command-line/#dotfiles)
-   [What Is "rc" and What Are "rc" Files?](https://www.baeldung.com/linux/rc-files)
-   [Things to keep in mind about Symbolic Links](https://linuxhandbook.com/symbolic-link-linux/#things-to-keep-in-mind-about-symbolic-links)

