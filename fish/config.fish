# Add installed brew packages to PATH
if test -e /opt/homebrew/bin/brew
    # Apple Silicon only - Intel Macs have homebrew in a different location
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

if status is-interactive
    set -U fish_greeting
end

# For Tide auto configuration, use:
#     tide-custom-autoconfigure

# Tide custom prompt
set --universal tide_left_prompt_items \
    shlvl pwd status cmd_duration context jobs newline character
set --universal tide_right_prompt_items \
    git direnv node python rustc java php pulumi ruby go gcloud distrobox toolbox terraform aws nix_shell crystal elixir time

set --universal tide_shlvl_icon ""
set --universal tide_git_icon "󰊢"
set --global tide_pwd_icon "$tide_pwd_icon "
set --global tide_pwd_icon_home "$tide_pwd_icon_home "
set --global tide_pwd_icon_unwritable "$tide_pwd_icon_unwritable "
set --global --export EDITOR "nvim"
set --global --export VISUAL "nvim"
