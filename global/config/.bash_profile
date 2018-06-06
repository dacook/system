
# Environment Variables
# PATH=$PATH:~/system/global/bin
PATH=$PATH:~/system/nix/scripts
source ~/system/global/config/colours.sh
source ~/system/squiz/server.bashrc

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
PATH=~/bin:$PATH;

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export GROOVY_HOME=/usr/local/opt/groovy/libexec
