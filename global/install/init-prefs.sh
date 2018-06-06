# Initialise Preferences
# also load OS-specific and work-specific stuff
# 
# prereq: install  Tomorrow colour scheme first to avoid sublime going crazy.

set -e # Exit on error
set -x # Display each command so user is aware of what's happening
home=/users/$USER
# config=$0/../config #~/system/global/config
config=$home/system/global/config 


## Link version controlled files in the relevant places
pushd $home/
	ln -snf "$config/.bash_profile"
	ln -snf "$config/.bash_aliases"
popd

## Sublime
pushd "$home/Library/Application Support/Sublime Text 3/Packages"
    mv User User.bak
	ln -snf "$config/sublime/User"
popd

## DiffMerge
pushd $home/Library/Preferences/
	ln -snf "$config/SourceGear\ DiffMerge\ Preferences"
popd

## Global Git Prefs (haven't linked the file in, because other parts of .gitconfig might be env-specific)
git config --global core.excludesfile "$config/global.gitignore"
git config --global push.default current # set upstream branchname to current branchname by default (https://stackoverflow.com/a/22933955/421243)
### Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
# https://gist.github.com/dacook/7eddd0c97b2844cc9157ba2e2f0470bd
git config --global alias.hist "log --pretty=format:'%C(blue)%ad%C(reset) %C(yellow)%h%C(reset) %C(green)%an%C(reset): %s %C(blue)%d%C(reset)' --graph --date=short"
git config --global alias.merge-upstream '!git fetch upstream && git merge upstream/master' #it may be tempting to rebase, but don't
### DiffMerge (http://twobitlabs.com/2011/08/install-diffmerge-git-mac-os-x/)
git config --global alias.showtool "!showci () { rev=$(git rev-parse \"${*:-HEAD}\"); git difftool $rev~1 $rev; }; showci" # https://stackoverflow.com/a/33975521/421243
git config --global difftool.prompt false
git config --global difftool.diffmerge.cmd 'diffmerge "$LOCAL" "$REMOTE"'
git config --global diff.tool diffmerge
git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.cmd 'diffmerge --merge --result="$MERGED" "$LOCAL" "$(if test -f "$BASE"; then echo "$BASE"; else echo "$LOCAL"; fi)" "$REMOTE"'
git config --global mergetool.diffmerge.trustExitCode true