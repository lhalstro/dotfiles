#------------------------------------------------------
#-----lhalstro-zshrc-----------------------------------
#------------------------------------------------------
#Main zshrc for unified settings across Linux and macOS

#Add local system-specific commands to: ~/.zshrc-custom
    #this file is sourced before AND after the below boiler
    #so you can provide or rely on dependencies as needed

#------------------------------------------------------
# LOAD CUSTOM SETTINGS THAT NEED TO BE FIRST
#------------------------------------------------------
export PREZSHRC=1
if [ -f "${HOME}/.zshrc-custom" ]; then
    source "${HOME}/.zshrc-custom"
fi
export PREZSHRC=0


#------------------------------------------------------
# oh-my-zsh boiler
#------------------------------------------------------

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git        #git aliases
    battery    #show battery status information???
    command-not-found #suggests commands when you enter one that doesnt exsit
    extract    #function to extract many kinds of archive files `extract file ?`
    sublime    #sublime text shortcuts
    tmux       #tmux aliases, compatibility checking
)

source $ZSH/oh-my-zsh.sh

# use 256 color terminal
export TERM=xterm-256color

#------------------------------------------------------
# Etc
#------------------------------------------------------

#add local bin to path
export PATH=$HOME/bin:$PATH

#For x11 (but not working on macOS catalina)
export DISPLAY=localhost:0.0

export DEFAULT_USER=lhalstro

# colored completion - use my LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## LOAD PYENV (IF INSTALLED)
if [ -d "${HOME}/.pyenv" ]; then
    # pyenv config
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    # Custom Python Modules
    if [ -d "${HOME}/lib" ]; then
        export PYTHONPATH="${PYTHONPATH}:${HOME}/lib/python"
    fi
fi

# vim please
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# VS Code aliases (I like these better than the ohmyzsh plugin)
alias c.="code ."
alias cn="code -n"
alias c="code"
alias cdiff="code --diff"


#------------------------------------------------------
# Aliases
#------------------------------------------------------
alias l='ls -lahort'
alias sl="ls"
alias lss="ls"
alias cd..="cd .."
alias cd-="cd -"

#smart grep (list, associated lines)
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
#get size of or find directories or files
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'


alias sourcez='source "${HOME}/.zshrc"'
alias untar="tar -xvf"

alias ipynb="jupyter notebook"
#size of directories in current level
alias dirsize="du -sh */"


alias serve='python -m SimpleHTTPServer'


#------------------------------------------------------
# OS-Specific Settings
#------------------------------------------------------

case "$OSTYPE" in
    darwin*)
    #--------------------------
    # On macOS/OS X environment
    export OSNAME="mac"

    #equivalent to solarized dark on macOS
    #see: https://github.com/seebi/dircolors-solarized/issues/10
    # export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
    # export LSCOLORS=exfxfeaeBxxehehbadacea

    ;;
    linux*)
    #---------------------
    # On linux environment
    export OSNAME="linux"

    #Check if on Windows Subsystem for Linux (WSL)
    unameout="$(uname -r)"
    if [[ $unameout = *microsoft* ]]; then
	export ONWSL=true
    else
	export ONWSL=false
    fi

    # #source Linux-specifc commands
    # source "${HOME}/.dotfiles/zsh/.zshrc-linux"

    #solarized dark theme colors
    eval `dircolors ~/.themes/dircolors-solarized/dircolors.ansi-dark`

    #open files with 'open' command
    alias open="xdg-open"

    ;;
    dragonfly*|freebsd*|netbsd*|openbsd*)
    #--------------------
    # On BSD environment
    export OSNAME="bsd"
    ;;
esac


#-------------------------------------------------------------------------------
#Source custom .zshrc (if it exists). Use for settings specific to local machine
#-------------------------------------------------------------------------------

if [ -f "${HOME}/.zshrc-custom" ]; then
    source "${HOME}/.zshrc-custom"
fi
# source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"
