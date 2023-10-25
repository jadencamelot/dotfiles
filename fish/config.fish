# Add installed brew packages to PATH
if test -e /opt/homebrew/bin/brew
    # Apple Silicon only - Intel Macs have homebrew in a different location
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

if status is-interactive
    set -U fish_greeting
end
