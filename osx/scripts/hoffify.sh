# Because sometimes you want to do it fast..
# curl -s https://raw.githubusercontent.com/dacook/system/master/osx/scripts/hoffify.sh | bash

imgsrc="http://www.flickeringmyth.com/wp-content/uploads/2015/03/hasselhoff.jpg"
imgpath="$PWD/unsuspicious-image-file.jpg"

curl -o "$imgpath" "$imgsrc"

## Set background images
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$imgpath\""
osascript -e "tell application \"System Events\" to set picture of every desktop to \"$imgpath\""

## More trolling
echo 'I love David Hasselhoff' | pbcopy
echo "Also, free chocolates on my desk, come and get them!" | mail -s "I have been Hoffed" melbourne@squiz.net
# can't seem to send uuencoded file attachments.. spam filter stops it and mail client can't display it anyway.
# (echo "Also, free chocolates on my desk, come and get them!"; uuencode $imgpath unsuspicious-image-file.jpg) | mail -s "I have been Hoffed" melbourne@squiz.net

## Say "Balls" randomly with a random voice every hour or so.. forever!
{
voices=($(say -v ? | egrep -o '^\w+' ))
while true;
do
  sleep $[RANDOM%3600+1];
  osascript -e "set volume 10";
  voice=${voices[$RANDOM % ${#voices[@]} ]}
  say -v "$voice" "balls";

  # And open up a nice picture
  open "$imgpath"

  # break;
done
} &

## hide the evidence!
exit