# .dotfiles

> The method used is explained in the [dotfiles' arch wiki page](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git).


## Installation
To set up your dotfiles on a new system, run the following commands:
```bash
git clone --bare git@github.com:bernas670/.dotfiles.git $HOME/.dotfiles && \
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"' && \
dotfiles checkout
```

### In case of conflicts
There are two possible options:
 1. Backup the existing files before checkout:
    ```bash
    mkdir -p .dotfiles-backup && \
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .dotfiles-backup/{} && \
    dotfiles checkout
    ```
 2. Force the checkout (overwriting existing files):
    ```bash
    dotfiles checkout -f
    ```

## Usage
Use the dotfiles alias to manage your dotfiles. For example:
```bash
dotfiles status
dotfiles add <file>
dotfiles commit -m "Update <file>"
dotfiles push
```