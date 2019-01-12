#!/usr/bin/env bash

####################################
#  macOS Setup Script - OS Config  #
#               v0.1               #
#            Jaden Burt            #
#                                  #
#      Created:  20/05/2017        #
####################################

##### OSX CONFIG #####

### General

# Always show scroll bars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Auto-hide menu bar
#defaults write NSGlobalDomain _HIHideMenuBar -bool YES

### Dock

# Speed up animations
defaults write com.apple.dock autohide-time-modifier -int 1
defaults write com.apple.dock autohide-delay -int 0

# Translucent icons for hidden apps
defaults write com.apple.Dock showhidden -bool YES

# Auto-hide dock
# TODO

### Sleep/Screen Saver

# Require password 10 seconds after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 10

### Screenshots

# Save screenshots to Screenshots folder
mkdir -p "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

### Keyboard

# Fast key repeat/delay
# TODO

# Disable requiring Fn key for F1-12 keys
# TODO

# Disable autocorrect/"smart typing" features
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

### Keyboard shortcuts - TODO

# Move left/right a space
# ⌘→
# ⌘←

# Notes.app

# Dashed List
# Cmd + Option + Shift + D
# Numbered List
# Cmd + Option + Shift + D
# Bulleted List
# Cmd + Option + Shift + D

### Trackpad

# Enable tap to click (current user AND login screen)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable "natural" (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

#TODO

### Sound

# Play feedback when volume is changed

### iCloud

### Finder

# Quit menu item
defaults write com.apple.finder QuitMenuItem -bool true

# Select text in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Users/Jaden/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Finder: show status bar and path bar
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories and remove the delay
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Automatically open a new Finder window when a volume is mounted
# TODO - why does this not work
#defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
#defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
#defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Automatically expand the following File Info panes:
# "General", "Open with", and "Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

killall Finder

### Save dialogs

# Always expand save/print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

### Printing

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

##### CLEANUP #####

# Restart affected apps
killall Dock
killall Finder
killall SystemUIServer
