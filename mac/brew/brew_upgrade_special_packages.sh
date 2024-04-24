#!/usr/bin/env bash

# Most Homebrew package upgrades can be managed via homebrew-autoupdate.
#
# However, some packages have special requirements which are handled here.


# yabai and skhd should not be upgraded while running.
# Otherwise macos removes accessibility permissions (manual fix required).
#
# These formulae stay pinned so they don"t get accidentally upgraded, either by
# homebrew-autoupdate or by running `brew upgrade` manually


function notify() {
    local readonly message=$1
    local readonly group=$2

    # Append to global output string
    if [[ -z "${output}" ]]; then
        output+="${message}"
    else
        output+="
${message}"
    fi

    echo ${group:+"-group $group"}

    # Notify using entire global buffer
    # terminal-notifier -title "🍻 Brew Upgrader" -message "${output}" "${group:+-group $group}"
    terminal-notifier -title "🍻 Brew Upgrader" -message "${output}" -group $2

    # Also print to stdout
    echo "${message}"
}

# yabai
if brew outdated | grep -q 'yabai'; then
	sleep 1

    output=''
    notify 'Yabai outdated - upgrading' 'yabai'

    brew unpin yabai

    notify '✋ Stopping yabai...' 'yabai'
    yabai --stop-service
    output+=' done.'

	sleep 3

    notify '⏳ Installing yabai...' 'yabai'
    brew upgrade yabai
    brew pin yabai
    output+=' done.'

	sleep 3

    notify '♻️ Starting yabai...' 'yabai'
    yabai --start-service
    output+=' done.'

    notify '' 'yabai'
    summary+='  ✅ Upgraded yabai'
else
    notify '✅ Skipping yabai (already up-to-date).' 'yabai'
    summary+='- Skipped yabai (already up-to-date)'
fi

# skhd
if ! brew outdated | grep -q 'skhd'; then
	sleep 1

    output=''
    notify 'skhd outdated - upgrading' 'skhd'

    brew unpin skhd

    notify '✋ Stopping skhd...' 'skhd'
    skhd --stop-service
    output+=' done.'

	sleep 3

    notify '⏳ Installing skhd...' 'skhd'
    brew upgrade skhd
    brew pin skhd
    output+=' done.'

	sleep 3

    notify '✅ Starting skhd...' 'skhd'
    skhd --start-service
    output+=' done.'

    notify '' 'skhd'
    summary+='  ✅ Upgraded skhd'
else
    notify '✅ Skipping skhd (already up-to-date).' 'skhd'
    summary+='- Skipped skhd (already up-to-date)'
fi

output="Summary:
$summary"
notify '' 'summary'
