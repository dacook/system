# Initialise Preferences
# todo: finishe this and test and use it. I don't think pushd likes tilde
# also load OS-specific and work-specific stuff

## Link version controlled files in the relevant places
config=$0/../config #~/system/global/config

pushd ~/
	ln -snf "$config/.bash_profile"
	ln -snf "$config/.bash_aliases"
popd

## Sublime
pushd "~/Library/Application Support/Sublime Text 3/Packages"
    mv User User.bak
	ln -snf "$config/sublime/User"
popd

## DiffMerge
pushd ~/Library/Preferences/
	ln -snf "$config/SourceGear\ DiffMerge\ Preferences"
popd

## Global Git Prefs (haven't linked the file in, because other parts of .gitconfig might be env-specific)
git config --global core.excludesfile "$config/global.gitignore"
### Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
# https://gist.github.com/dacook/7eddd0c97b2844cc9157ba2e2f0470bd
git config --global alias.hist "log --pretty=format:'%C(yellow)%ad%C(reset) %C(green)%h%C(reset) %C(red)%an%C(reset): %s %C(blue)%d%C(reset)' --graph --date=short"
### DiffMerge (http://twobitlabs.com/2011/08/install-diffmerge-git-mac-os-x/)
git config --global difftool.prompt false
git config --global difftool.diffmerge.cmd 'diffmerge "$LOCAL" "$REMOTE"'
git config --global diff.tool diffmerge
git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.cmd 'diffmerge --merge --result="$MERGED" "$LOCAL" "$(if test -f "$BASE"; then echo "$BASE"; else echo "$LOCAL"; fi)" "$REMOTE"'
git config --global mergetool.diffmerge.trustExitCode true