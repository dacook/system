# Clear system DNS cache (might be necessary after switching mobile wifi connections)
## OSX 10.10.4+

sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo "Cache flushed."

#or, turn wifi connection off and on again.