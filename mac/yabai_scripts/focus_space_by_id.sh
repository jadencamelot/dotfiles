#!/bin/bash

# Source: https://github.com/koekeishiya/yabai/issues/205#issuecomment-1072082380

# Had to change the window index in the jq query to use .windows[-1] instead of .windows[0]
# Not sure why, but otherwise an inaccessible Window ID appears as the first item in
#   every space, and throws an error.

readonly index=$1
eval "$(yabai -m query --spaces | jq --argjson index "${index}" -r '(.[] | select(.index == $index).windows[-1]) as $wid | if $wid then "yabai -m window --focus \"" + ($wid | tostring) + "\"" else "skhd --key \"ctrl - " + (map(select(."is-native-fullscreen" == false)) | index(map(select(.index == $index))) + 1 % 10 | tostring) + "\"" end')"
