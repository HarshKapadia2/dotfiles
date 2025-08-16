# Dotfiles

[Harsh Kapadia](https://harshkapadia.me)'s dotfiles and scripts.

## Installables

### Dotfiles

- [clang-format](https://clang.llvm.org/docs/ClangFormat.html): [`.clang-format`](.clang-format)
- [EditorConfig](https://editorconfig.org): [`.editorconfig`](.editorconfig)
- [Git](https://git-scm.com): [`.gitconfig`](.gitconfig)
- [Prettier](https://prettier.io): [`.prettierrc`](.prettierrc)
- [tmux](https://tmux.github.io): [`.tmux.conf`](.tmux.conf)
- [Vim](https://www.vim.org): [vim](vim)

### Scripts

- [htop](https://htop.dev): [hhtop](hhtop)
- [PS1 customization](customize-ps1)
- [KVM/QEMU](kvm-qemu)

### Packages Installed

NOTE: Packages are selectively installed based on the options provided by the
user. Please refer to the [documentation below](#documentation).

#### General Packages

- `curl`
- `gh` (For GitHub auth)
- `git`
- `man`
- `net-tools` (For `ifconfig`)
- `openssh-client`
- `openssh-server`
- `tmux`
- `tree`
- `vim`

#### Vim Plugin-Specific Packages

- `bear` (For YouCompleteMe Vim plugin)
- `build-essential` (For YouCompleteMe Vim plugin)
- `clang-format` (For formatting C files)
- `cmake` (For YouCompleteMe Vim plugin)
- `nodejs` (For Prettier)
- `npm` (For Prettier)
- `prettier` (For Prettier)
- `python3`
- `python3-dev` (For YouCompleteMe Vim plugin)
- `shellcheck`
- `shfmt` (For formatting Shell/Bash scripts)

## Setup Instructions

```bash
# Navigate to the current user's home directory
$ cd ~

# Clone the repository
$ git clone https://github.com/HarshKapadia2/dotfiles.git

# Navigate to the dotfiles repository
$ cd ~/dotfiles

# Run the setup script WITHOUT sudo permissions (the user will be requested for
# the sudo password when required)
# Read the documentation below to understand all the available options
$ ./setup --vim plugins

# Check if symlinked dotfiles are present
$ ls -al ~
```

## Documentation

```shell
NAME
        setup - Setup Harsh Kapadia's dotfiles, and install scripts and packages

SYNOPSIS
        ./setup [--force-setup] [--install-pkg] [--vim vimrc_type]
                [--delete] [-h|--help]

DESCRIPTION
        This utility can symlink dotfiles to the current user's home directory,
        install programs (scripts) and packages, and remove/undo the setup as much
        as possible.

        Dotfiles supported: .clang-format, .editorconfig, .gitconfig, .prettierrc,
        .tmux.conf, .vimrc (with and without plugins)

OPTIONS
        If no options are given, dotfiles are symlinked (ones already present are
        skipped), the custom 'hhtop' utility is setup and Bash's PS1 is customized
        to display Git repository information.

        --force-setup
                For every dotfile in the repository, delete the corresponding
                dotfile/symlink in the current user's home directory (if it exists) and
                then symlink the dotfile in this repository in its place.

                Requirement: Optional

        --vim vimrc_type
                Choose which type of Vim configuration file should be installed.

                The supported vimrc_type values are 'base' and 'plugins' (without
                quotes for both values), with the default value being 'base' if the
                option is not used.

                Requirement: Optional

                The 'base' value installs a barebones .vimrc file that only configures
                the editor's in-built settings and has no external dependencies in terms
                of packages or plugins.

                If the 'plugins' value is used, a .vimrc file that uses vim-plug to
                install and manage Vim plugins will be symlinked. Check the
                'vim/plugins/.vimrc' file for the plugins that will be installed. This
                file also includes all the settings from the above 'base' .vimrc file.
                Quite a lot of the plugins require external packages to function, so
                using this value will also automatically install all packages that are
                installed by --install-pkg.

                Examples:
                ./setup --vim base                  # Default value that symlinks
                                                    # vim/base/.vimrc

                ./setup --vim base --install-pkg    # Symlinks vim/base/.vimrc and
                                                    # only installs 'General packages'
                                                    # installed by --install-pkg

                ./setup --vim plugins               # Symlinks vim/plugins/.vimrc and
                                                    # installs all packages installed by
                                                    # --install-pkg

                ./setup --vim plugins --install-pkg # Same as the above command

        --install-pkg
                Install packages and Vim plugin-extras on supported OSs.

                The packages installed by this option depend on the value provided to
                the --vim option. For the value 'base' (default if option not
                mentioned), only 'General packages' (listed below) are installed. For
                the 'plugins' value, both, the 'General packages' and the 'Vim
                plugin-specific packages' (listed below), are installed.

                Requirement: Optional, but note that some Vim plugins depend on packages
                to be installed to work.

                General packages: curl, gh, git, man, net-tools, openssh-client,
                openssh-server, tmux, tree, vim

                Vim plugin-specific packages: bear, build-essential, clang-format,
                cmake, nodejs, npm, prettier, python3, python3-dev, shellcheck, shfmt

                Supported OSs: Debian-based distros that support APT, like Ubuntu.

                NOTE: shfmt is available only on Ubuntu >= v22 and so the script will
                fail on Ubuntu OSs less than that version.

        --delete
                Remove all dotfile symlinks and delete any related files, like all Vim
                plugins mentioned in the .vimrc file. It will also attempt to clean the
                insalled programs (scripts) like 'hhtop'. Packages are not uninstalled.

                Requirement: Optional

                NOTE: No other option will be executed if this option is mentioned, with
                the exception of -h or --help.

        -h, --help
                Print this command usage instruction.

                Requirement: Optional

                NOTE: No other option will be executed if this option is mentioned.

AUTHOR
        Harsh Kapadia ( https://harshkapadia.me )

WWW
        https://github.com/HarshKapadia2/dotfiles

REPORTING BUGS
        Report bugs and improvements at
        https://github.com/HarshKapadia2/dotfiles/issues .
```

## Resources

- [The Missing Semester of Your CS Education: Dotfiles](https://missing.csail.mit.edu/2020/command-line/#dotfiles)
- [What Is "rc" and What Are "rc" Files?](https://www.baeldung.com/linux/rc-files)
- [Things to keep in mind about Symbolic Links](https://linuxhandbook.com/symbolic-link-linux/#things-to-keep-in-mind-about-symbolic-links)
- [Solving the Dotfiles Problem (And Learning Bash)](https://www.youtube.com/watch?v=mSXOYhfDFYo)
