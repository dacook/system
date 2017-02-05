# Terminal colours
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
LIGHTBLACK=$(tput setaf 8)
BOLD=$(tput bold)
RESET=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

## Can't remember why not just use the control codes directly. Note that tput is not available in Windows Powershell. Eg:
LIGHTBLACK=$(echo -en '\033[00;90m')
BOLD=$(echo -en '\033[00;1m')
RESET=$(echo -en '\033[00;0m')