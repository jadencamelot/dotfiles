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

cp files/inputrc ~/.inputrc
cp files/bash_profile ~/.bash_profile

source ~/.inputrc
source ~/.bash_profile

### Sublime Text 3

# TODO: sync preferences via symlink to Dropbox/iCloud

### Safari

# UBlock Origin

# Download manually from here: (can't script as it's prerelease-only)
# https://github.com/el1t/uBlock-Safari/releases

### Jitouch

# Copy preferences file
cp files/com.jitouch.Jitouch.plist ~/Library/Preferences

# Force Jitouch to stay open (prevent periodical quit due to trial version)
mkdir -p ~/Library/LaunchAgents
cp files/com.jitouch.Jitouch.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.jitouch.Jitouch.plist
