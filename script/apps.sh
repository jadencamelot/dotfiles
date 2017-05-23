#!/usr/bin/env bash

##################################
#   macOS Setup Script - Config  #
#              v0.1              #
#           Jaden Burt           #
#                                #
#     Created:  20/05/2017       #
##################################

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