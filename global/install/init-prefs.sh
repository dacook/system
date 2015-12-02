# Initialise Preferences
# todo: finishe this and test and use it
# also load OS-specific and work-specific stuff..

## Link version controlled files in the relevant places
config=$0/../config #~/system/global/config

pushd ~/
	ln -snf "$config/.bash_profile"
	ln -snf "$config/.bash_aliases"
popd

## Sublime
# actually, probably do this whole folder, with gitignore for cache type stuff
pushd "~/Library/Application Support/Sublime Text 3/Packages/User/"
	ln -snf "$config/Preferences.sublime-settings"
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
### DiffMerge (http://twobitlabs.com/2011/08/install-diffmerge-git-mac-os-x/)
git config --global difftool.prompt false
git config --global difftool.diffmerge.cmd 'diffmerge "$LOCAL" "$REMOTE"'
git config --global diff.tool diffmerge
git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.cmd 'diffmerge --merge --result="$MERGED" "$LOCAL" "$(if test -f "$BASE"; then echo "$BASE"; else echo "$LOCAL"; fi)" "$REMOTE"'
git config --global mergetool.diffmerge.trustExitCode true