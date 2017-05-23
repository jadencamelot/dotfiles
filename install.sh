##################################
#    macOS Setup Script - Apps   #
#              v0.1              #
#           Jaden Burt           #
#                                #
#     Created:  20/05/2017       #
#     Modified: 21/05/2017       #
##################################

##### INSTALL APPS #####

# Homebrew
#xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Brew packages
brew install archey
brew install autojump
brew install bash-completion
brew install python
brew install terminal-notifier
#brew install thefuck
#brew install youtube-dl

### Casks

brew cask install 1password
#brew cask install amethyst
brew cask install appcleaner
#brew cask install battle-net
brew cask install cheatsheet
brew cask install coconutbattery
#brew cask install discord
brew cask install docker
brew cask install firefox
brew cask install flux
brew cask install google-chrome
#brew cask install inky
brew cask install jitouch
#brew cask install keka
#brew cask install little-snitch
brew cask install nvalt
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install rocket-chat
brew cask install spectacle
brew cask install spotify
#brew cask install steam
brew cask install sublime-text
brew cask install suspicious-package
#brew cask install transmission
brew cask install vlc

### App Store

# Mac app store CLI - required for rest of script
brew install mas

mas install 682658836 # Garageband
#mas install 931202332 # MiniPlayer
# Bandwidth+

### Manual Download

# Microsoft Office
# Parallels Desktop / VMWare Fusion
# Blackstar INSIDER
# ScreenShade

##### CONFIG #####





##### APP CONFIG #####

### Sublime Text 3

# TODO: sync preferences via symlink to Dropbox/iCloud

### Safari

# UBlock Origin

# Download manually from here: (can't script as it's prerelease-only)
# https://github.com/el1t/uBlock-Safari/releases

### Jitouch

# Copy preferences file

# Force Jitouch to stay open (prevent periodical quit due to trial version)
#cp ~/somewhere ~/Library/LaunchAgents/com.jitouch.Jitouch.plist
#launchctl load ~/Library/LaunchAgents/com.jitouch.Jitouch.plist

##### DONE #####

echo "All done! Please restart for some system changes to take effect."


