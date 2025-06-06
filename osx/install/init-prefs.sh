# Initialise OSX Preferences - stored here in version control

## Link version controlled files in the relevant places
config=$0/../config #~/system/osx/config
echo $config

# TODO: for each "$config/Library/Services/*"
# pushd ~/Library/Services
# 	ln -snf "$config/Library/Services"
# popd

# Key bindings for Home and End keys. (probably requires restart)
mkdir -pv ~/Library/KeyBindings
pushd ~/Library/KeyBindings
	ln -snf "$config/Library/KeyBindings/DefaultKeyBinding.Dict"
popd

# Alfred preferences (not sync folder because I'm too cheap for powerpack ;)
# pushd ~/Library/Application\ Support/Alfred\ 2/
# 	mv Alfred.alfredpreferences Alfred.alfredpreferences.bak
# 	ln -snf "$config/Alfred.alfredpreferences"
# popd

## Try to prevent the network interfaces being shutdown when locking the screen
pushd /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources
	sudo ./airport en0 prefs DisconnectOnLogout=NO
popd

# Set default launcher for text files: Sublime Text 4 (https://apple.stackexchange.com/questions/123833/replace-text-edit-as-the-default-text-editor/123834#123834)
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.4;}'
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType=public.data;LSHandlerRoleAll=com.sublimetext.4;}'
