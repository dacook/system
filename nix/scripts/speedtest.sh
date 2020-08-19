out=speedtest.csv 
args="--format=csv"

# Hardcoded header row because it was simpler than working with generated one
if [[ ! -s $out ]]; then
  echo '"date","server name","server id","latency","jitter","packet loss","download","upload","download bytes","upload bytes","share url"' >> $out
fi

# Add as first column to line
echo -n '"'`date`'"', >> $out

# Run speedtest and output results to file
speedtest $args >> $out

# Doesn't handle errors, results in an unfinished line. TODO: redirect first line of stderr to file 