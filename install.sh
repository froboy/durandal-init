#!/usr/bin/env bash

# This is heavily inspired by the amazing Michelle & Luke
# https://github.com/craychee/loki-init
# https://github.com/lukewertz/gabriel-init
# "If things around here aren't working, it's because I'm laughing so hard."

function pause() {
  read -p "$*"
}

CWD=($PWD)

cd ~

# We can't get them directly, but just click this button :)
xcode-select --install

pause 'Press [Enter] once you have installed XCode and XCode Command Line Tools.'

# Just make sure...
sudo xcodebuild -license accept

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installing software...
brew install ruby
brew install git
brew install wget

# Browsers
brew cask install google-chrome
brew cask install firefox

# Random Mac tools
brew cask install macdown # Write better README.md's
brew cask install spotify # 🎶

# Install the MacAppStore CLI and git some apps.
# If you haven't purchased these in the App Store, this won't work.
brew install mas
mas signin froboy@gmail.com # This will give a warning if you signed in to iCloud when you set up the computer.
mas install 1333542190 # 1Password
mas install 1179623856 # Pastebot
mas install 899972312 # WordService
mas install 417375580 # BetterSnapTool
mas install 405772121 # LittleIpsum
# mas install 668208984 # GIPHY CAPTURE (Using Kap for now)
mas install 803453959 # Slack
mas install 975937182 # Fantastical 2
mas install 425955336 # Skitch
mas install 1384080005 # Tweetbot
mas install 692867256 # Simplenote
# id's above are tied to specific versions.
# They're most certainly out of date...
mas upgrade

# Dev tools
# brew cask install vagrant
brew cask install virtualbox
brew cask install sequel-pro
brew cask install visual-studio-code
# brew cask install sourcetree
# brew cask install torguard
# brew cask install phpstorm # ⌨️⛈
# brew cask install gitkraken # 🍴
brew cask install kap # 🖥📷
brew install node
brew install npm

# Get composer and put it in the right place. This will require your password
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Be sure we can vagrant
# brew install ansible
# vagrant plugin install vagrant-hostmanager
# vagrant plugin install vagrant-auto_network

# echo "Setting up Atom... you'll have to enter your deets in Settings:Sync Settings"
# brew cask install atom
# apm install sync-settings

# Set up PHP tools
# https://philsturgeon.uk/php/2013/08/20/php-static-analysis-in-sublime-text/
# http://benmatselby.github.io/sublime-phpcs/
# This happens in containers now...
# echo "Setting up PHP Tools"
# sudo chown -R `whoami` /usr/local
# brew tap homebrew/homebrew-php
# brew install phpmd
# brew install php-code-sniffer
# brew install php-cs-fixer

# Do the Mac thing that you have to do but you shouldn't have to do
# This https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
#curl -o ~/Library/LaunchAgents/ssh.add.a.plist https://raw.githubusercontent.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain/master/ssh.add.a.plist
touch ~/.ssh/config
echo "Host *
   AddKeysToAgent yes
   UseKeychain yes" >> ~/.ssh/config


# Hold my own hand to make sure I finish configuring.
echo "Add your ssh keys (you put them in your secret hiding place)."
pause 'Press [Enter] when you have added your ssh key.'
chmod 400 ~/.ssh/*

# Move preference files
echo "Setting up your preference files."
cp .gitconfig ~/.gitconfig
cp .gitignore_global ~/.gitignore_global
cp .profile ~/.profile

# Get git things
curl -o /usr/local/etc/bash_completion.d/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o /usr/local/etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo "NICE WORK! Now get going... THEY'RE EVERYWHERE!!!"
