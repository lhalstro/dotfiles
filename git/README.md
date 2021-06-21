# profiles for git

## Setup
- `cd ~`
- `cp .dotfiles/git/.gitconfig .`
    - don't link because username, keychain are system-specific
- DEPRICATED - now you can make default branch "main" in git config, dont need git-template
    - ~~`ln -s .dotfiles/git/.git-template`~~
        - ~~template makes it so that default branch is "main", not "master~~
	- ~~To use template when initating a repo, add to gitconfig:~~
	     - [init]
		- templateDir = ~/.git-template/

## Other
Copy `.gitignore` into desired repo
