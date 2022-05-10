zmodload zsh/zprof

echo "debug: starting zshrc"

# #default for these is 10k, but shell is slow
# HISTSIZE=1000
# SAVEHIST=1000

#------------------------------------------------------
#-----lhalstro-zshrc-----------------------------------
#------------------------------------------------------


#-------------------------------------------------------------------
# Source custom zshrc for custom commands to run before boiler zshrc
#-------------------------------------------------------------------
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
## ZSH_THEME="half-life"
# ##Much simpler and faster theme:
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git        #git aliases
    battery    #show battery status information???
    command-not-found #suggests commands when you enter one that doesnt exsit
    extract    #function to extract many kinds of archive files `extract file ?`
    # sublime    #sublime text shortcuts
    tmux       #tmux aliases, compatibility checking
)

source $ZSH/oh-my-zsh.sh

# use 256 color terminal
    #original
export TERM=xterm-256color
    #xterm wasnt available on all systems, but also, below command messed up my tmux
# export TERM=screen-256color
# #     # more generic, compatible with PFE (default is screen-256color
# # export TERM=screen

#------------------------------------------------------
# Etc
#------------------------------------------------------

#add local bin to path
export PATH=$HOME/bin:$PATH
#also this local bin for local installs
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

#For x11 (but not working on macOS catalina)
    #including this makes overgrid not work
# export DISPLAY=localhost:0.0

export DEFAULT_USER=lhalstro

# colored completion - use my LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ## LOAD PYENV (IF INSTALLED)
# if [ -d "${HOME}/.pyenv" ]; then
#     # pyenv config
#     export PYENV_ROOT="$HOME/.pyenv"
#     export PATH="$PYENV_ROOT/bin:$PATH"
#     eval "$(pyenv init -)"
# fi
# # Custom Python Modules
# if [ -d "${HOME}/lib" ]; then
#     export PYTHONPATH="${PYTHONPATH}:${HOME}/lib/python"
# fi

# vim please
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# VS Code aliases (I like these better than the ohmyzsh plugin)
alias c.="code ."
alias cn="code -n"
alias c="code"
alias cdiff="code --diff"
alias cz='code "${HOME}/.zshrc"'
alias czc='code "${HOME}/.zshrc-custom"'

#------------------------------------------------------
# Aliases
#------------------------------------------------------
alias l='ls -lahort'
alias lsl='ls -la' #list, showing permissions
alias lss='ls -lShr' #list by size, biggest lowest
alias sl="ls"
# alias lss="ls"
alias cd..="cd .."
alias cd-="cd -"

alias lns="ln -s"

#pwd to absolute path ("physical")
alias pwdp="pwd -P"
#absolute path to file, including filename
alias rl="readlink -f"

#smart grep (list, associated lines)
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
#get size of or find directories or files
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

#size of directories in current level, excluding links, sort with largest on bottom
    # alias dirsize="du -sh */"
alias dirsize="find . -mindepth 1 -maxdepth 1 -type d -exec du -sh {} + | sort  -h"

#faster imagemagick
alias disp="display"
alias di="display"


sedf () {
    #use sed to file/replace strings in a file
    #$1=find, $2=replace, $3=file
    sed -i "s/$1/$2/g" $3
}
#same as above, but with a pipe so you can replace "/"
sedfpipe () { sed -i "s|$1|$2|g" $3 }

#convert a symbolic link into a hard copy
delink () {
    if [ -L $1 ] && [ -e $1 ]; then
        cp -p --remove-destination `readlink $1` $1
    fi
}

#b () {find . -name "$2" -exec $1 {} \; }
b () {
    #given command, then list of inputs, execute in a loop
    cmd=$1
    inps=(${@:2})
    for inp in $inps;
    do
	$cmd $inp
    done
}


alias sourcez='source "${HOME}/.zshrc"'
alias viz='vi "${HOME}/.zshrc"'
alias vizc='vi "${HOME}/.zshrc-custom"'

#easy decompress
alias untar="tar -xvf"
#easy compress FILE into FILE.tar.gz
mytar () {tar -czvf ${1}.tar.gz $1}
#list the contents of a tarfile
alias viewtar="tar -tvf"

#LaTeX AND PDFs
#forced latex build
tx () {
    #run it twice because TeX
    pdflatex -interaction=nonstopmode $1
    pdflatex -interaction=nonstopmode $1
}
#compress pdf
compresspdf () {
    #compress filename.pdf into compress_filename.pdf using GhostScript
    #MAIN COMMAND: gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=output.pdf input.pdf
    if [ -z "$1" ]; then
        echo "ERROR: Must specify file to compress"
        echo "compresspdf file.pdf [LVL]"
        exit 1
    fi
    #compression level settings (lowest to highest)
    if   [ "$2" = "1" ]; then
	    complvl="-dPDFSETTINGS=/prepress"
    elif [ "$2" = "2" ]; then
	    complvl="-dPDFSETTINGS=/print"
    elif [ "$2" = "3" ]; then
	    complvl="-dPDFSETTINGS=/ebook"
    elif [ "$2" = "4" ]; then
	    complvl="-dPDFSETTINGS=/screen"
    else
        complvl=""
    fi
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 $complvl -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="compress_$1" $1
}


alias ipynb="jupyter notebook"
#install/update my list of default packages
alias pipupdate="pip install --upgrade -r ~/.dotfiles/ipython/default_packages.txt"

#view with imagemagick
alias di="display"

#toggle whether git status/branch is shown in commandline
tog_gitstat () {
    #getting the status of a git repo can make oh-my-zsh very slow
    #Use this command to toggle between globally showing status or not
    gstat=`grep hide-status ${HOME}/.gitconfig | sed 's/[^0-9]//g'`
    if [ "$gstat" = "1" ]; then
	gstat2=0
    else
	gstat2=1
    fi
    kw="hide-status"
    sed -i "s/$kw = $gstat/$kw = $gstat2/g" ${HOME}/.gitconfig
    kw="hide-dirty"
    sed -i "s/$kw = $gstat/$kw = $gstat2/g" ${HOME}/.gitconfig
    # git config --global oh-my-zsh.hide-status  $gstat
    # git config --global oh-my-zsh.hide-dirty  $gstat
}


alias topme="top -u lhalstro"

#------------------------------------------------------
# OS-Specific Settings
#------------------------------------------------------

case "$OSTYPE" in
    darwin*)
    #--------------------------
    # On macOS/OS X environment
    export OSNAME="mac"

    #add homebrew's bin to path
    export PATH="/usr/local/sbin:$PATH"

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



## LOAD PYENV (IF INSTALLED)
if [ -d "${HOME}/.pyenv" ]; then
    # pyenv config
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)" #5/26/21 now need this in addition for shims
    eval "$(pyenv init -)"
    #on macOS, homebrew sometimes installs over python. This command fixes pyenv:
    alias fixpyenv="pyenv rehash"
fi
# Custom Python Modules
if [ -d "${HOME}/lib" ]; then
    export PYTHONPATH="${PYTHONPATH}:${HOME}/lib/python"
fi


echo "debug: ending zshrc"
