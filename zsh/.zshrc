#-----lhalstro-software-----------------------------------
# oh-my-zsh boiler
#------------------------------------------------------

# Path to your oh-my-zsh configuration.
#export ZSH=/home/lhalstro/.oh-my-zsh
export ZSH=/Users/lhalstro/.oh-my-zsh
echo "need separate paths to ohmyzsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that soh-my-zsh is loaded.

ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
plugins=(git battery command-not-found extract sublime tmux)

source $ZSH/oh-my-zsh.sh

# use 256 color terminal
export TERM=xterm-256color

#------------------------------------------------------
# Etc
#------------------------------------------------------
# export DISPLAY=localhost:0.0
export DEFAULT_USER=lhalstro
#eval `dircolors ~/.themes/dircolors-solarized/dircolors.ansi-dark`

#equivalent to solarized dark on macOS
    #see: https://github.com/seebi/dircolors-solarized/issues/10
# export LSCOLORS=exfxfeaeBxxehehbadacea
# export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

echo "need variable dircolors"

# colored completion - use my LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# vim please
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR




#add local bin to path
export PATH=/home/lhalstro/bin:$PATH


#------------------------------------------------------
# CFD Tools
#------------------------------------------------------

#CHIMERA GRID TOOLS

echo "NOT INCLUDEING CGT INSTALL PATHS RIGHT NOW"
# # cgt exports for building
# export TCLDIR_INC="/usr/include/tcl8.5"
# export TKDIR_INC="/usr/include/tcl8.5"
# export X11DIR_INC="/usr/include"
# export TCLDIR_SO="/usr/lib/x86_64-linux-gnu"
# export TKDIR_SOf="/usr/lib/x86_64-linux-gnu"
# export X11DIR_SO="/usr/lib/x86_64-linux-gnu"
# export TCL_LIBRARY="/usr/share/tcltk/tcl8.5"
# export TK_LIBRARY="/usr/share/tcltk/tk8.5"
# export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu"
# #last line messes up paraview because it needs to use its local qt5
#     #seems like cgt works when commenting this out after installing cgt
# export PYTHON_INC="/usr/include/python2.7"
# export PYTHONPATH="/home/lhalstro/software/chimera/chimera2.1/smart/bin"

# # #test cgt env vars
# # ls $TCLDIR_INC
# # ls "$TKDIR_INC"
# # ls "$X11DIR_INC"
# # ls "$TCLDIR_SO"
# # ls "$TKDIR_SOf"
# # ls "$X11DIR_SO"
# # ls "$TCL_LIBRARY"
# # ls "$TK_LIBRARY"
# # ls "$LD_LIBRARY_PATH"
# # ls "$PYTHON_INC"
# # ls "$PYTHONPATH"
# # ls /home/lhalstro/fake


# cgt exports for use
export PATH=/home/lhalstro/software/chimera/chimera2.1/bin_dp:$PATH
export SCRIPTLIB=/home/lhalstro/software/chimera/chimera2.1/scriptlib
export CGTBINDIR=/home/lhalstro/software/chimera/chimera2.1/bin_dp

#CGT Aliases
alias be='export F_UFMTENDIAN=big'
alias le='export F_UFMTENDIAN=little'
alias curendian='echo $F_UFMTENDIAN'

#OVERFLOW
# add overflow executables to path
# export PATH="/home/lhalstro/software/overflow/over2.3/bin:$PATH"
# export PATH="/home/lhalstro/software/overflow/overflow_2.3_distribution/source/over2.3/bin:$PATH"
export PATH="/home/lhalstro/software/overflow/overflow_2.3_distribution/source/over2.3/bin_dp:$PATH"
# export PATH="/home/lhalstro/software/overflow/over2.2l/bin:$PATH"

#OVERLST
alias gridsz="/home/lhalstro/software/overlst/v2.2.0/utils/gridsz/gridsz"
alias qinfo="/home/lhalstro/software/overlst/v2.2.0/utils/qinfo"
alias overlst="/home/lhalstro/software/overlst/v2.2.0/bin/overlst"

#PARAVIEW
export PATH="/home/lhalstro/software/paraview/ParaView-5.8.0-MPI-Linux-Python3.7-64bit/bin:$PATH"

#path to 'libSurfaceLIC.so' plug in in paraview install
    #This variable is used by my custom autorendering library for paraview
export PARAVIEW_LIC_PATH="/home/lhalstro/software/paraview/ParaView-5.8.0-MPI-Linux-Python3.7-64bit/lib/paraview-5.8/plugins/SurfaceLIC/SurfaceLIC.so"

#------------------------------------------------------
# Aliases
#------------------------------------------------------
alias l='ls -lahort'

alias serve='python -m SimpleHTTPServer'

# alias open="xdg-open"
echo "variable alias for open"


