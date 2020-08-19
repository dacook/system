#GAH, I knew I should have stopped 40 mins ago.. srsly. can't strip all newlines because we want the header. date would be better at start of line. better to just add hardcoded header.


out=speedtest.csv 
args=("--format=csv" "--progress=yes") #sadly progress doesn't work in csv mode

if [[ ! -s $out ]]; then
  args+=("--output-header")
fi

# Run speedtest and output results or errors to file (without newline)
echo $(speedtest ${args[@]} 2>&1) | tr -d "\n" >> $out

# Append date to line
echo ,'"'`date`'"' >> $out