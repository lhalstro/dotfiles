#!/bin/bash
#Legend for git status symbols in powerlevel10k prompt

echo "⇣42     if behind the remote."
echo "⇡42     if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42."
echo "⇠42     if behind the push remote."
echo "⇢42     if ahead of the push remote; no leading space if also behind: ⇠42⇢42."
echo "*42     if have stashes."
echo "'merge' if the repo is in an unusual state."
echo "~42     if have merge conflicts."
echo "+42     if have staged changes."
echo "!42     if have unstaged changes."
echo "?42     if have untracked files."
echo ""─"     if the number of unstaged files is unknown."
