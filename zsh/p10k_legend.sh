#!/bin/bash

# DESCRIPTION: Legend for git status symbols in powerlevel10k prompt
# SETUP: (add to user bin) `ln -s ~/.dotfiles/zsh/p10k_legend.sh ~/bin/p10k_legend`

echo "POWERLEVEL 10K COMMAND PROMPT LEGEND"
echo ""
echo "GIT STATUS"
echo "⇣42     if behind the remote. (pull to clear)"
echo "⇡42     if ahead of the remote; if also behind the remote: ⇣42⇡42. (push to clear)"
echo "⇠42     if behind the push remote."
echo "⇢42     if ahead of the push remote; no leading space if also behind: ⇠42⇢42."
echo "*42     if have stashes. ('git stash clear' to clear)"
echo "'merge' if the repo is in an unusual state."
echo "~42     if have merge conflicts."
echo "+42     if have staged changes. (commit to clear)"
echo "!42     if have unstaged changes. (commit to clear)"
echo "?42     if have untracked files. (add or ignore files to clear)"
echo ""─"     if the number of unstaged files is unknown."
