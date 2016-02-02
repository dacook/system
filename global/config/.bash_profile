
# Environment Variables
PATH=$PATH:~/system/global/bin
source ~/system/global/config/colours.sh

# Simple Command Prompt
PS1='\[$BLUE\]\w \$\[$RESET\] '

# Aliases
source ~/.bash_aliases

# Env specific
#if os eq 'osx'
	source ~/system/osx/config/osx.bash_profile
#fi