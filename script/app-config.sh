#!/usr/bin/env bash

##################################
#   macOS Setup Script - Config  #
#              v0.1              #
#           Jaden Burt           #
#                                #
#     Created:  20/05/2017       #
##################################

##### APP CONFIG #####

### Terminal

# TODO: import theme profile
# files/Theme.terminal

### Bash

cp files/inputrc ~/.inputrc
cp files/bash_profile ~/.bash_profile

source ~/.inputrc
source ~/.bash_profile

### Fish

# TODO

### Sublime Text 3

# TODO: sync preferences via symlink to Dropbox/iCloud

### Chrome

# Set up multiple profiles
# Install extensions (mainly UBlock Origin)
# Configure chrome settings
#   - block 3rd party cookies
#   - disable search suggestions etc

### Jitouch

# Copy preferences file
cp files/com.jitouch.Jitouch.plist ~/Library/Preferences

# Force Jitouch to stay open (prevent periodical quit due to trial version)
# Should no longer be necessary, now that licenses have become free
#mkdir -p ~/Library/LaunchAgents
#cp files/com.jitouch.Jitouch.plist ~/Library/LaunchAgents/
#launchctl load ~/Library/LaunchAgents/com.jitouch.Jitouch.plist
