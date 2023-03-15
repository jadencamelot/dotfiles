!#/usr/bin/env bash

# Remove "bold look" fonts for Alacritty on MacOS 11 and later - see https://github.com/alacritty/alacritty/issues/4616
defaults write org.alacritty AppleFontSmoothing -int 0
