PATH=$PATH:~/system/osx/bin

eval "$(rbenv init -)"

# # Ruby installed with Homebrew
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/ruby/lib"
# export CPPFLAGS="-I/usr/local/opt/ruby/include"

# # Sass installed by homebrew ruby, but seems to have been placed in osx ruby..
# export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

export PATH="/usr/local/sbin:$PATH" # brew doctor: Warning: Homebrew's "sbin" was not found in your PATH..

# Enable Ctrl-S for (forward-)i-search
# https://stackoverflow.com/a/58565714/421243
stty -ixon

# Because of NSCFConstantString warning: https://github.com/rails/rails/issues/38560
OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# But it still didn't help when using Spring, so I disabled spring in most contexts (see .bash_aliases)
# DISABLE_SPRING=true
