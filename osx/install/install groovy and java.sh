# Java http://www.lonecpluspluscoder.com/2017/04/27/installing-java-8-jdk-os-x-using-homebrew/
brew update
brew tap caskroom/cask
brew cask install java
java --version #confirm installed version

# Groovy http://richardsumilang.com/programming/groovy/install-groovy-on-os-x/
brew install groovy
echo "export GROOVY_HOME=/usr/local/opt/groovy/libexec" | tee -a ~/.bash_profile; source ~/.bash_profile
groovy --version #confirm installed version

# Note: Groovy Version: 2.4.14 with JVM: 9.0.4 causes warnings to appear: 
#   WARNING: An illegal reflective access operation has occurred