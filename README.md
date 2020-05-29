# dotfiles

My personal collection of dotfiles. You should free to use some, all, or none of these.

### Install Dependencies
- oh-my-zsh
    - [Install zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
    - Install [oh-my-zsh](https://ohmyz.sh/#install)
    - Might need to move your .zshrc back into place and/or set zsh as default shell
- vim
    - vundle package manager: https://github.com/VundleVim/Vundle.vim
    - `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    - Install Plugins:
        - Launch vim and run `:PluginInstall`
        - Or, to install from command line: `vim +PluginInstall +qall`
- pyenv
    - https://github.com/pyenv/pyenv/wiki/Common-build-problems
- tmux
    - `sudo apt-get install tmux`
    - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

- theme [solarized dark](https://github.com/seebi/dircolors-solarized)
    - `mkdir ~/.themes`
    - `cd ~/.themes`
    - `git clone https://github.com/seebi/dircolors-solarized.git`

### Install Profiles

I recommend using [stow](https://www.gnu.org/software/stow/) to set these up on your machine:

```
git clone git@github.com:ldhalstrom/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow tmux
stow vim
stow zsh
```

You will also need to install oh-my-zsh and pyenv. pyenv has a lot of dependencies, which can be found [here](https://github.com/pyenv/pyenv/wiki/Common-build-problems). I think that being able to easily switch between python versions and virtual environments is worth it, though. If you don't think so, just remove those lines from the zshrc.

This theme is primarily solarized dark, dircolors were taken from [here](https://github.com/seebi/dircolors-solarized). If tmux looks off then you probably forgot to install [tpm](https://github.com/tmux-plugins/tpm) and install the plugins.

### To Do

- fix theme colors on macOS
    -dircolors command doesnt work


Awesome idea to make os-specific zshrc: https://unix.stackexchange.com/questions/252166/how-to-configure-zshrc-for-specfic-os


