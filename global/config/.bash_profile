
# Environment Variables
# PATH=$PATH:~/system/global/bin
PATH=$PATH:~/system/nix/scripts
source ~/system/global/config/colours.sh

# Simple Command Prompt
PS1='\[$BLUE\]\w \$\[$RESET\] '

# Aliases
source ~/.bash_aliases

# Features
if [ -f ~/system/global/config/git-completion.bash ]; then
  . ~/system/global/config/git-completion.bash
fi

# Env specific
#if os eq 'osx'
	source ~/system/osx/config/osx.bash_profile
#fi

# added by Anaconda2 4.1.1 installer
export PATH="/Users/dcook/anaconda2/bin:$PATH"
