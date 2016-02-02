# Initialise OSX Preferences - stored here in version control

## Link version controlled files in the relevant places
config=$0/../config #~/system/osx/config
echo $config

# TODO: for each "$config/Library/Services/*"
# pushd ~/Library/Services
# 	ln -snf "$config/Library/Services"
# popd
#

# TODO: add alfred (not sync folder because I'm too cheap for powerpack ;)
# ~/Library/Application Support/Alfred 2/Alfred.alfredpreferences