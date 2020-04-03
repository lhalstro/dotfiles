#ADD LOCAL BIN FOLDER TO PATH
export PATH=$PATH:~/bin

#TERMINAL APPEARANCE
#color-code files in terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#Set what is displayed in terminal in front of $ (host name)
    #\d – Current date
    #\t – Current time
    #\h – Host name
    #\# – Command number
    #\u – User name
    #\W – Current working directory (i.e: Desktop/)
    #\w – Current working directory, full path (i.e: /Users/Admin/Desktop)
#host_name:current_directory_path$
# export PS1="\h:\w$ "
#Show current directory and user name with $
export PS1="\W \u\$ "

#PYENV INIT IN PATH TO ENABLE SHIMS AND AUTOCOMPLETE
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#PARAVIEW
export PATH=$PATH:/Applications/ParaView-5.7.0.app/Contents/bin

# ALIASES
alias l="ls -lahort"
alias sl="ls"
alias lss="ls"
alias cd..="cd .."
alias cd-="cd -"
alias vibash="vi $HOME/.bash_profile"
alias sourcebash="source $HOME/.bash_profile"
#alias python=python3
#alias pip=pip3
# alias of230="source $HOME/OpenFOAM/OpenFOAM-2.3.1/etc/bashrc"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias pv="/Applications/ParaView-5.7.0.app/Contents/MacOS/paraview"
alias paraview="/Applications/ParaView-5.7.0.app/Contents/MacOS/paraview"
alias tec360="/Volumes/SAN128/Applications/Tecplot\ 360\ EX\ 2015\ R2/Tecplot\ 360\ EX\ 2015\ R2.app/Contents/MacOS/Tecplot\ 360\ EX\ 2015\ R2"
alias ipynb="jupyter notebook"
alias xfoil="/Applications/Xfoil.app/Contents/Resources/xfoil"
# alias latex="/usr/local/texlive/2014/bin/x86_64-darwin/latex"

#size of directories in current level
alias dirsize="du -sh */"
