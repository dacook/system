# Initialise OSX Preferences - stored here in version control

## Link version controlled files in the relevant places
config=$0/../config #~/system/osx/config
echo $config

# TODO: for each "$config/Library/Services/*"
# pushd ~/Library/Services
# 	ln -snf "$config/Library/Services"
# popd

# Alfred preferences (not sync folder because I'm too cheap for powerpack ;)
pushd ~/Library/Application\ Support/Alfred\ 2/
	mv Alfred.alfredpreferences Alfred.alfredpreferences.bak
	ln -snf "$config/Alfred.alfredpreferences"
popd

## Try to prevent the network interfaces being shutdown when locking the screen
pushd /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources
	sudo ./airport en0 prefs DisconnectOnLogout=NO
popd