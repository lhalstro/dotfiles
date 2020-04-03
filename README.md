# dotfiles

My personal collection of dotfiles. You should free to use some, all, or none of these. I recommend using [stow](https://www.gnu.org/software/stow/) to set these up on your machine:

```
git clone git@github.com:ldhalstrom/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow tmux
stow vim
stow zsh
```

You will also need to install oh-my-zsh and pyenv. pyenv has a lot of dependencies, which can be found [here](https://github.com/pyenv/pyenv/wiki/Common-build-problems). I think that being able to easily switch between python versions and virtual environments is worth it, though. If you don't think so, just remove those lines from the zshrc.

This theme is primarily solarized dark, dircolors were taken from [here](https://github.com/seebi/dircolors-solarized). If tmux looks off then you probably forgot to install [tpm](https://github.com/tmux-plugins/tpm) and install the plugins.

