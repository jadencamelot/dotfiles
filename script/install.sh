#!/usr/bin/env bash

##################################
#    macOS Setup Script - Apps   #
#              v0.1              #
#           Jaden Burt           #
#                                #
#     Created:  20/05/2017       #
##################################

INSTALL_MODE="personal"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install autojump
brew install bash-completion
brew install ffmpeg
brew install fish
#brew install hashcat
#brew install mitmproxy
brew install mono
brew install nmap
brew install npm
brew install p7zip
brew install python
#brew install sqlmap
brew install ssss
brew install terminal-notifier


# Install casks
brew cask install 1password
brew cask install appcleaner
brew cask install coconutbattery
brew cask install docker
brew cask install firefox
brew cask install flux
brew cask install font-hack
brew cask install google-chrome
brew cask install jitouch
<<<<<<< HEAD
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
=======
#brew cask install keka
#brew cask install little-snitch
#brew cask install nvalt
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
#brew cask install rocket-chat
>>>>>>> 295c7a35bb51458914de3d654b8c351441ca9431
brew cask install spectacle
brew cask install sublime-text
brew cask install suspicious-package
brew cask install visual-studio-code

## Personal
if [[ $INSTALL_MODE = "personal" ]]; then
	#brew cask install battle-net
	brew cask install discord
	brew cask install spotify
	brew cask install steam
	brew cask install transmission
	brew cask install vlc
fi

<<<<<<< HEAD
## Work
if [[ $INSTALL_MODE = "work" ]]; then
	#brew cask install burp-suite
	brew cask install hipchat
	brew cask install little-snitch
	brew cask install microsoft-office
	#brew cask install owasp-zap
	brew cask install tunnelblick
	brew cask install vmware-fusion
fi
=======
# Mac app store CLI - required for rest of script
brew install mas

#mas install 682658836 # Garageband
#mas install 931202332 # MiniPlayer
#mas install 490461369 # Bandwidth+

### Manual Download

# Microsoft Office
# Parallels Desktop / VMWare Fusion
# Blackstar INSIDER
# ScreenShade
>>>>>>> 295c7a35bb51458914de3d654b8c351441ca9431
