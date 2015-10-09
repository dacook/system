#http://apple.stackexchange.com/a/99866/61710
sudo su root
#[type your administrator password when prompted]
cd /Library/LaunchAgents
launchctl remove `basename com.adobe.ARM.* .plist`
launchctl remove `basename com.adobe.AAM.* .plist`
launchctl remove com.adobe.ARM.Scheduler-1.0
launchctl remove com.adobe.AAM.Scheduler-1.0
rm com.adobe.ARM.*
rm com.adobe.AAM.*
#exit


# My solution: delete anything adobe. (Not yet tested)
# don't need to sudo su root, in my case I need to stay logged in as my own username

# based from http://lifecs.likai.org/2011/02/real-way-to-disable-adobe-updater-from.html?showComment=1377880106057#c6995586688244783428
launchctl list | grep -o '\S*adobe\S*' | while read x; do launchctl remove $x; done

#then maybe rm the /Library/LaunchAgents/*.plist file too
rm /Library/LaunchAgents/*adobe*


# Try and mv this file (https://forums.adobe.com/thread/1362074)
pushd ~/Library/Application\ Support/Adobe/AAMUpdater/1.0
mv AdobeUpdaterPrefs.dat _AdobeUpdaterPrefs.dat
popd